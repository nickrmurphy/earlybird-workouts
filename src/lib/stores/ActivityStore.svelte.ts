import type { RestTimer, Timer } from "$lib/state";

type ActivityStore = {
  restTimer: RestTimer;
  activityTimer: Timer;
  currentId?: number;
};

export const ActivityStore = $state<ActivityStore>({
  restTimer: undefined!, // Set on app initialization in hooks.client.ts
  activityTimer: undefined!, // Set on app initialization in hooks.client.ts
  currentId: undefined,
});
