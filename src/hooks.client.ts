import { Activity, globalState } from "$lib/state";
import type { ClientInit } from "@sveltejs/kit";

export const init: ClientInit = async () => {
  globalState.activity = new Activity();
};
