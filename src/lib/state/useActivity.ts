import { useSyncExternalStore } from "react";
import { activity } from "./Activity";

function useActiveId() {
  return useSyncExternalStore(activity.subscribe, activity.getSnapshot);
}

function useTimer() {
  return useSyncExternalStore(
    activity.timer.subscribe,
    activity.timer.getSnapshot,
  );
}

function useRestTimer() {
  return useSyncExternalStore(
    activity.restTimer.subscribe,
    activity.restTimer.getSnapshot,
  );
}

export { useActiveId, useRestTimer, useTimer };
