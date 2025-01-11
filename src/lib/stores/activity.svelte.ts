import type { RestTimer } from "$lib/models";

type ActivityStore = {
  restTimer: RestTimer;
};

export const activity = $state<ActivityStore>({
  restTimer: undefined!, // Set on app initialization in hooks.client.ts
});
