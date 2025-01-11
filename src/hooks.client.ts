import { RestTimer } from "$lib/models";
import {
  EquipmentService,
  ExerciseService,
  MuscleGroupService,
  WorkoutHistoryService,
  WorkoutService,
} from "$lib/services";
import { activity, services } from "$lib/stores";
import type { ClientInit } from "@sveltejs/kit";
import Database from "@tauri-apps/plugin-sql";

export const init: ClientInit = async () => {
  const dbConnection = await Database.load("sqlite:earlybirdworkouts.db");

  services.exercise = new ExerciseService(dbConnection);
  services.workout = new WorkoutService(dbConnection);
  services.workoutHistory = new WorkoutHistoryService(dbConnection);
  services.equipment = new EquipmentService(dbConnection);
  services.muscleGroup = new MuscleGroupService(dbConnection);

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
