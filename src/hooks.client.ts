import type { ClientInit } from "@sveltejs/kit";
import Database from "@tauri-apps/plugin-sql";
import { db } from "$lib/db.svelte";
import { services } from "$lib/services.svelte";
import { WorkoutService } from "$lib/WorkoutService";

export const init: ClientInit = async () => {
  const dbConnection = await Database.load("sqlite:earlybirdworkouts.db");
  db.earlybird = dbConnection;
  services.workout = new WorkoutService(dbConnection);
};
