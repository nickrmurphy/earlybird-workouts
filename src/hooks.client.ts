import { migrator } from "$lib/database/db";
import { Activity, globalState } from "$lib/state";
import type { ClientInit } from "@sveltejs/kit";

export const init: ClientInit = async () => {
  await migrator.migrateToLatest();
  globalState.activity = new Activity();
};
