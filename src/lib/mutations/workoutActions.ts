import { goto } from "$app/navigation";
import { services } from "$lib/stores";
import { mutation } from "$lib/utils";

export const createWorkout = async (name: string) =>
  mutation(services.workouts.createWorkout(name));

export const addExercise = async (workoutId: string, exerciseId: string) =>
  mutation(services.workouts.addExercise(workoutId, exerciseId));

export const removeExercise = async (workoutId: string, exerciseId: string) =>
  mutation(services.workouts.removeExercise(workoutId, exerciseId));

export const deleteWorkout = async (workoutId: string) =>
  mutation(services.workouts.deleteWorkout(workoutId));

export const updateWeight = async (
  workoutId: string,
  exerciseId: string,
  weight: number,
) =>
  mutation(services.workouts.setExerciseWeight(workoutId, exerciseId, weight));

export const updateSets = async (
  workoutId: string,
  exerciseId: string,
  sets: number,
) => mutation(services.workouts.setExerciseSets(workoutId, exerciseId, sets));

export const updateReps = async (
  workoutId: string,
  exerciseId: string,
  reps: number,
) => mutation(services.workouts.setExerciseReps(workoutId, exerciseId, reps));

export const startWorkout = async (workoutId: string) => {
  await mutation(
    services.workoutHistory.createWorkoutHistoryAndSets(workoutId),
  ).then(() => goto("/active"));
};

export const renameWorkout = async (workoutId: string, name: string) =>
  await mutation(services.workouts.renameWorkout(workoutId, name));

export const updatePosition = async (
  workoutId: string,
  exerciseId: string,
  position: number,
) =>
  mutation(
    services.workouts.setExercisePosition(workoutId, exerciseId, position),
  );
