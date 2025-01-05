import { RestTimer } from "$lib/models";

export const activityStore = $state({
  restTimer: new RestTimer(60),
});
