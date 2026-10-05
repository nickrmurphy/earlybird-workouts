import { Store } from "./Store";

type TimerSnapshot = {
  seconds: number;
  isRunning: boolean;
};

class Timer extends Store<TimerSnapshot> {
  #startTime: Date | undefined = undefined;
  #intervalId: ReturnType<typeof setInterval> | undefined = undefined;

  constructor() {
    super({ seconds: 0, isRunning: false });
  }

  start(startTime?: Date) {
    clearInterval(this.#intervalId);
    this.#startTime = startTime ?? new Date();
    this.#intervalId = setInterval(() => this.#tick(), 1000); // 1000 milliseconds = 1 second
    this.#tick();
  }

  stop() {
    clearInterval(this.#intervalId);
    this.#intervalId = undefined;
    this.#startTime = undefined;
    this.setSnapshot({ seconds: 0, isRunning: false });
  }

  get seconds() {
    return this.getSnapshot().seconds;
  }

  get isRunning() {
    return this.getSnapshot().isRunning;
  }

  #tick() {
    const seconds = this.#startTime
      ? Math.floor((new Date().getTime() - this.#startTime.getTime()) / 1000)
      : 0;
    this.setSnapshot({ seconds, isRunning: true });
  }
}

export { Timer };
export type { TimerSnapshot };
