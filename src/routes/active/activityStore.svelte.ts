import { RestTimer } from "$lib/models";

export const activityStore = $state({
  restTimer: new RestTimer({
    loader: () => {
      const restTimer = localStorage.getItem("restTimer");
      return restTimer ? parseInt(restTimer, 10) : 60;
    },
    persister: (value) => {
      localStorage.setItem("restTimer", value.toString());
    },
  }),
});
