export class RestTimer {
  private intervalId: number | undefined = undefined;
  private runTimeSeconds = 0;
  elapsedTime = $state(0);
  isRunning = $state(false);
  isExpired = $derived(this.elapsedTime >= this.runTimeSeconds);

  constructor(runTimeSeconds: number) {
    this.runTimeSeconds = runTimeSeconds;
  }

  start() {
    this.intervalId = setInterval(() => {
      this.elapsedTime++;
    }, 1000); // 1000 milliseconds = 1 second
    this.isRunning = true;
  }

  stop() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
      this.elapsedTime = 0;
      this.isRunning = false;
    }
  }
}
