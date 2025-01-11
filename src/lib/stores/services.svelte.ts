import type {
  EquipmentService,
  ExerciseService,
  MuscleGroupService,
  WorkoutHistoryService,
  WorkoutService,
} from "$lib/services";

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
