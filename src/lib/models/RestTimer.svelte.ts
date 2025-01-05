export class RestTimer {
  private intervalId: number | undefined = $state(undefined);
  private runTimeSeconds = 0;
  private startTime: Date | undefined = undefined;
  elapsedTime = $state(0);
  isRunning = $derived(this.intervalId !== undefined);
  isExpired = $derived(this.elapsedTime >= this.runTimeSeconds);

  constructor(runTimeSeconds: number) {
    this.runTimeSeconds = runTimeSeconds;
  }

  start() {
    this.startTime = new Date();
    this.intervalId = setInterval(() => {
      if (this.startTime) {
        this.elapsedTime = Math.floor(
          (new Date().getTime() - this.startTime.getTime()) / 1000
        );
      } else {
        this.elapsedTime = 0;
      }
    }, 1000); // 1000 milliseconds = 1 second
  }

  stop() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
      this.elapsedTime = 0;
      this.startTime = undefined;
    }
  }
}
