import { RestTimer } from "./RestTimer";
import { Store } from "./Store";
import { Timer } from "./Timer";

function loadRestTimer() {
  const restTimer = localStorage.getItem("restTimer");
  return restTimer ? parseInt(restTimer, 10) : 60;
}

function persistRestTimer(value: number) {
  localStorage.setItem("restTimer", value.toString());
}

/** The active workout: its history id, elapsed timer and rest timer. */
class Activity extends Store<string | undefined> {
  readonly timer = new Timer();
  readonly restTimer = new RestTimer({
    loader: loadRestTimer,
    persister: persistRestTimer,
  });

  constructor() {
    super(localStorage.getItem("activeHistoryId") || undefined);
  }

  get currentId(): string | undefined {
    return this.getSnapshot();
  }

  setCurrentId(id: string) {
    this.timer.stop();
    this.restTimer.stop();
    localStorage.setItem("activeHistoryId", id);
    this.setSnapshot(id);
  }

  clearCurrentId() {
    this.timer.stop();
    this.restTimer.stop();
    localStorage.removeItem("activeHistoryId");
    this.setSnapshot(undefined);
  }
}

const activity = new Activity();

export { activity };
