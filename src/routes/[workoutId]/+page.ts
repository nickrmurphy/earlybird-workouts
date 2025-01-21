import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params, url }) => {
  const workoutId = Number(params.workoutId);
  const exerciseIdParam = url.searchParams.get("exerciseId");

  const exercise = exerciseIdParam
    ? await services.workout.getExercise(workoutId, parseInt(exerciseIdParam))
    : undefined;

  return {
    exercise,
    workoutId,
  };
};
