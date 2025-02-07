import { RestTimer, Timer } from "$lib/state";

function loadRestTimer() {
  const restTimer = localStorage.getItem("restTimer");
  return restTimer ? parseInt(restTimer, 10) : 60;
}

function persistRestTimer(value: number) {
  localStorage.setItem("restTimer", value.toString());
}

class Activity {
  restTimer: RestTimer;
  timer: Timer;
  #currentId = $state<string | undefined>(undefined);

  constructor() {
    this.#currentId = localStorage.getItem("activeHistoryId") || undefined;
    this.timer = new Timer();
    this.restTimer = new RestTimer({
      loader: loadRestTimer,
      persister: persistRestTimer,
    });
  }

  get currentId(): string | undefined {
    return this.#currentId;
  }

  set currentId(id: string) {
    this.#currentId = id;
    this.timer.stop();
    this.restTimer.stop();
    localStorage.setItem("activeHistoryId", id);
  }

  clearCurrentId() {
    this.#currentId = undefined;
    this.timer.stop();
    this.restTimer.stop();
    localStorage.removeItem("activeHistoryId");
  }
}

export { Activity };
