import { RestTimer } from "$lib/models";
import { activity } from "$lib/stores";
import type { ClientInit } from "@sveltejs/kit";

export const init: ClientInit = async () => {
  activity.restTimer = new RestTimer({
    loader: () => {
      const restTimer = localStorage.getItem("restTimer");
      return restTimer ? parseInt(restTimer, 10) : 60;
    },
    persister: (value) => {
      localStorage.setItem("restTimer", value.toString());
    },
  });
};
