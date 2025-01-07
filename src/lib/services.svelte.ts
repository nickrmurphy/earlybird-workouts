import Database from "@tauri-apps/plugin-sql";
import type { WorkoutService } from "./WorkoutService";
import type { WorkoutHistoryService } from "./WorkoutHistoryService";
import type { ExerciseService } from "./ExerciseService";
import type { EquipmentService } from "./EquipmentService";
import type { MuscleGroupService } from "./MuscleGroupService";

type ServiceStore = {
  exercise: ExerciseService;
  equipment: EquipmentService;
  muscleGroup: MuscleGroupService;
  workout: WorkoutService;
  workoutHistory: WorkoutHistoryService;
};

export const services = $state<ServiceStore>({
  exercise: undefined!, // Set on app initialization in hooks.client.ts
  equipment: undefined!, // Set on app initialization in hooks.client.ts
  muscleGroup: undefined!, // Set on app initialization in hooks.client.ts
  workout: undefined!, // Set on app initialization in hooks.client.ts
  workoutHistory: undefined!, // Set on app initialization in hooks.client.ts
});
