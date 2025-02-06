class Timer {
  #startTime: Date | undefined = undefined;
  #intervalId: NodeJS.Timeout | undefined = $state(undefined);
  #elapsedTime = $state(0);
  #isRunning = $derived(!!this.#intervalId);

  start(startTime?: Date) {
    this.#startTime = startTime ?? new Date();
    this.#intervalId = setInterval(() => {
      if (this.#startTime) {
        this.#elapsedTime = Math.floor(
          (new Date().getTime() - this.#startTime.getTime()) / 1000,
        );
      } else {
        this.#elapsedTime = 0;
      }
    }, 1000); // 1000 milliseconds = 1 second
  }

  stop() {
    clearInterval(this.#intervalId);
    this.#intervalId = undefined;
    this.#startTime = undefined;
    this.#elapsedTime = 0;
  }

  get seconds() {
    return this.#elapsedTime;
  }

  get isRunning() {
    return this.#isRunning;
  }
}

export { Timer };
