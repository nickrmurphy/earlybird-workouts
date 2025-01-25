import { goto } from "$app/navigation";
import { services } from "$lib/stores";
import { mutation } from "$lib/utils";

export const createWorkout = async (name: string) =>
  mutation(services.workout.createWorkout(name));

export const addExercise = async (workoutId: string, exerciseId: string) =>
  mutation(services.workout.addExercise(workoutId, exerciseId));

export const removeExercise = async (workoutId: string, exerciseId: string) =>
  mutation(services.workout.removeExercise(workoutId, exerciseId));

export const deleteWorkout = async (workoutId: string) =>
  mutation(services.workout.deleteWorkout(workoutId));

export const updateWeight = async (
  workoutId: string,
  exerciseId: string,
  weight: number,
) =>
  mutation(services.workout.setExerciseWeight(workoutId, exerciseId, weight));

export const updateSets = async (
  workoutId: string,
  exerciseId: string,
  sets: number,
) => mutation(services.workout.setExerciseSets(workoutId, exerciseId, sets));

export const updateReps = async (
  workoutId: string,
  exerciseId: string,
  reps: number,
) => mutation(services.workout.setExerciseReps(workoutId, exerciseId, reps));

export const startWorkout = async (workoutId: string) => {
  await mutation(
    services.workoutHistory.createWorkoutHistoryAndSets(workoutId),
  );
  goto("/active");
};

export const renameWorkout = async (workoutId: string, name: string) =>
  await mutation(services.workout.renameWorkout(workoutId, name));

export const updatePosition = async (
  workoutId: string,
  exerciseId: string,
  position: number,
) =>
  mutation(
    services.workout.setExercisePosition(workoutId, exerciseId, position),
  );
