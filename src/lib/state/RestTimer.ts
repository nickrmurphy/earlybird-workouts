import { Store } from "./Store";

type RestTimerSnapshot = {
  elapsedTime: number;
  runTimeSeconds: number;
  isRunning: boolean;
  isExpired: boolean;
};

class RestTimer extends Store<RestTimerSnapshot> {
  #startTime: Date | undefined = undefined;
  #intervalId: ReturnType<typeof setInterval> | undefined = undefined;
  #persister: (value: number) => void;

  constructor({ loader, persister }: { loader: () => number; persister: (value: number) => void }) {
    super({
      elapsedTime: 0,
      runTimeSeconds: loader(),
      isRunning: false,
      isExpired: false,
    });
    this.#persister = persister;
  }

  get runTimeSeconds() {
    return this.getSnapshot().runTimeSeconds;
  }

  set runTimeSeconds(value: number) {
    this.#persister(value);
    this.#update({ runTimeSeconds: value });
  }

  get isRunning() {
    return this.getSnapshot().isRunning;
  }

  start() {
    clearInterval(this.#intervalId);
    this.#startTime = new Date();
    this.#intervalId = setInterval(() => {
      const elapsedTime = this.#startTime
        ? Math.floor((new Date().getTime() - this.#startTime.getTime()) / 1000)
        : 0;
      this.#update({ elapsedTime });
    }, 1000); // 1000 milliseconds = 1 second
    this.#update({ elapsedTime: 0, isRunning: true });
  }

  stop() {
    if (this.#intervalId) {
      clearInterval(this.#intervalId);
      this.#intervalId = undefined;
      this.#startTime = undefined;
      this.#update({ elapsedTime: 0, isRunning: false });
    }
  }

  toggle() {
    if (this.isRunning) {
      this.stop();
    } else {
      this.start();
    }
  }

  #update(changes: Partial<Omit<RestTimerSnapshot, "isExpired">>) {
    const next = { ...this.getSnapshot(), ...changes };
    next.isExpired = next.elapsedTime >= next.runTimeSeconds;
    this.setSnapshot(next);
  }
}

export { RestTimer };
export type { RestTimerSnapshot };
