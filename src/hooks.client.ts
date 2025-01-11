import { db } from "$lib/db.svelte";
import {
  EquipmentService,
  ExerciseService,
  MuscleGroupService,
  WorkoutHistoryService,
  WorkoutService,
} from "$lib/services";
import { services } from "$lib/services.svelte";
import type { ClientInit } from "@sveltejs/kit";
import Database from "@tauri-apps/plugin-sql";

export const init: ClientInit = async () => {
  const dbConnection = await Database.load("sqlite:earlybirdworkouts.db");
  db.earlybird = dbConnection;

  services.exercise = new ExerciseService(dbConnection);
  services.workout = new WorkoutService(dbConnection);
  services.workoutHistory = new WorkoutHistoryService(dbConnection);
  services.equipment = new EquipmentService(dbConnection);
  services.muscleGroup = new MuscleGroupService(dbConnection);
};
