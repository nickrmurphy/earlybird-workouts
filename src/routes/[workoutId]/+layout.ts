import {
  getEquipment,
  getExercises,
  getMuscles,
  getWorkout,
} from "$lib/resources";
import type { LayoutLoad } from "./$types";

export const prerender = false;

export const load: LayoutLoad = async ({ params, depends }) => {
  const [allEquipment, allMuscles, allExercises, workoutData] =
    await Promise.all([
      getEquipment(),
      getMuscles(),
      getExercises(),
      getWorkout(params.workoutId),
    ]);

  const { key, workout } = workoutData;

  depends(key);

  return {
    workout,
    allEquipment,
    allMuscles,
    // TODO: Add instructions to exercises
    allExercises: allExercises.map((exercise) => ({
      ...exercise,
      instructions: [],
    })),
  };
};
