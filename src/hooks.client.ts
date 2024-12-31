import type { ClientInit } from "@sveltejs/kit";
import Database from "@tauri-apps/plugin-sql";
import { db } from "$lib/db.svelte";
import { services } from "$lib/services.svelte";
import { WorkoutService } from "$lib/WorkoutService";
import { WorkoutHistoryService } from "$lib/WorkoutHistoryService";
import { ExerciseService } from "$lib/ExerciseService";

export const init: ClientInit = async () => {
  const dbConnection = await Database.load("sqlite:earlybirdworkouts.db");
  db.earlybird = dbConnection;

  services.exercise = new ExerciseService(dbConnection);
  services.workout = new WorkoutService(dbConnection);
  services.workoutHistory = new WorkoutHistoryService(dbConnection);
};
