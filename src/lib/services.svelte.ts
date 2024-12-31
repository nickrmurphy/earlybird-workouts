import Database from "@tauri-apps/plugin-sql";
import type { WorkoutService } from "./WorkoutService";

type ServiceStore = {
  workout: WorkoutService;
};

export const services = $state<ServiceStore>({
  workout: undefined!, // Set on app initialization in hooks.client.ts
});
