import Database from "@tauri-apps/plugin-sql";
import type { WorkoutService } from "./WorkoutService";
import type { WorkoutHistoryService } from "./WorkoutHistoryService";

type ServiceStore = {
  workout: WorkoutService;
  workoutHistory: WorkoutHistoryService;
};

export const services = $state<ServiceStore>({
  workout: undefined!, // Set on app initialization in hooks.client.ts
  workoutHistory: undefined!, // Set on app initialization in hooks.client.ts
});
