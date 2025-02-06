import type { RestTimer, Timer } from "$lib/stores";

type ActivityStore = {
  restTimer: RestTimer;
  activityTimer: Timer;
};

export const ActivityStore = $state<ActivityStore>({
  restTimer: undefined!, // Set on app initialization in hooks.client.ts
  activityTimer: undefined!, // Set on app initialization in hooks.client.ts
});
