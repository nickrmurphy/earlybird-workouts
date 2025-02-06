import { RestTimer, Timer } from "$lib/state";
import { ActivityStore } from "$lib/stores";
import type { ClientInit } from "@sveltejs/kit";

function loadRestTimer() {
  const restTimer = localStorage.getItem("restTimer");
  return restTimer ? parseInt(restTimer, 10) : 60;
}

function persistRestTimer(value: number) {
  localStorage.setItem("restTimer", value.toString());
}

export const init: ClientInit = async () => {
  ActivityStore.activityTimer = new Timer();
  ActivityStore.restTimer = new RestTimer({
    loader: loadRestTimer,
    persister: persistRestTimer,
  });
};
