import { Activity } from "$lib/state";
import { GlobalStore } from "$lib/stores";
import type { ClientInit } from "@sveltejs/kit";

export const init: ClientInit = async () => {
  GlobalStore.Activity = new Activity();
};
