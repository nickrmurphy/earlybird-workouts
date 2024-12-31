import type { PageLoad } from "./$types";
import { services } from "$lib/services.svelte";

export const load: PageLoad = async ({ params }) => {
  const workoutId = Number(params.workoutId);
  const exerciseId = Number(params.exerciseId);

  const exercise = await services.workout.getExercise(workoutId, exerciseId);

  return {
    exercise,
    workoutId,
    exerciseId,
  };
};
