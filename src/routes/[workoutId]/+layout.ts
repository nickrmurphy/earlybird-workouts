import {
  getEquipment,
  getExercises,
  getMuscles,
  getWorkout,
} from "$lib/resources";
import { getWorkoutExercisesForWorkout } from "$lib/resources/workoutExercises";
import type { LayoutLoad } from "./$types";

export const prerender = false;

export const load: LayoutLoad = async ({ params, depends }) => {
  const [
    allEquipment,
    allMuscles,
    allExercises,
    workoutData,
    workoutExerciseData,
  ] = await Promise.all([
    getEquipment(),
    getMuscles(),
    getExercises(),
    getWorkout(params.workoutId),
    getWorkoutExercisesForWorkout(params.workoutId),
  ]);

  const { key, workout } = workoutData;
  const { key: exerciseKey, workoutExercises } = workoutExerciseData;

  depends(key);
  depends(exerciseKey);

  return {
    workout,
    workoutExercises,
    allEquipment,
    allMuscles,
    allExercises,
  };
};
