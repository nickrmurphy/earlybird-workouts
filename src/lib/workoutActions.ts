import { goto } from "$app/navigation";
import { services } from "$lib/services.svelte";
import { mutation } from "$lib/utils";

export const createWorkout = async (name: string) =>
  mutation(services.workout.createWorkout(name));

export const addExercise = async (workoutId: number, exerciseId: number) =>
  mutation(services.workout.addExercise(workoutId, exerciseId));

export const removeExercise = async (workoutId: number, exerciseId: number) =>
  mutation(services.workout.removeExercise(workoutId, exerciseId));

export const deleteWorkout = async (workoutId: number) =>
  mutation(services.workout.deleteWorkout(workoutId));

export const updateWeight = async (
  workoutId: number,
  exerciseId: number,
  weight: number
) =>
  mutation(services.workout.setExerciseWeight(workoutId, exerciseId, weight));

export const updateSets = async (
  workoutId: number,
  exerciseId: number,
  sets: number
) => mutation(services.workout.setExerciseSets(workoutId, exerciseId, sets));

export const updateReps = async (
  workoutId: number,
  exerciseId: number,
  reps: number
) => mutation(services.workout.setExerciseReps(workoutId, exerciseId, reps));

export const startWorkout = async (workoutId: number) => {
  await mutation(
    services.workoutHistory.createWorkoutHistoryAndSets(workoutId)
  );
  goto("/active");
};
