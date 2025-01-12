export class RestTimer {
  #startTime: Date | undefined = undefined;
  #intervalId: number | undefined = $state(undefined);
  #runTimeSeconds = $state(0);
  #persister: (value: number) => void = () => {};

  elapsedTime = $state(0);
  isRunning = $derived(this.#intervalId !== undefined);
  isExpired = $derived(this.elapsedTime >= this.runTimeSeconds);

  constructor({
    loader,
    persister,
  }: {
    loader: () => number;
    persister: (value: number) => void;
  }) {
    this.#runTimeSeconds = loader();
    this.#persister = persister;
  }

  get runTimeSeconds() {
    return this.#runTimeSeconds;
  }

  set runTimeSeconds(value: number) {
    this.#runTimeSeconds = value;
    this.#persister(value);
  }

  start() {
    this.#startTime = new Date();
    this.#intervalId = setInterval(() => {
      if (this.#startTime) {
        this.elapsedTime = Math.floor(
          (new Date().getTime() - this.#startTime.getTime()) / 1000,
        );
      } else {
        this.elapsedTime = 0;
      }
    }, 1000); // 1000 milliseconds = 1 second
  }

  stop() {
    if (this.#intervalId) {
      clearInterval(this.#intervalId);
      this.#intervalId = undefined;
      this.#startTime = undefined;
      this.elapsedTime = 0;
    }
  }

  toggle() {
    if (this.isRunning) {
      this.stop();
    } else {
      this.start();
    }
  }
}
