import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params, url }) => {
  const workoutId = params.workoutId;
  const exerciseIdParam = url.searchParams.get("exerciseId");

  const exercise = exerciseIdParam
    ? await services.workout.getExercise(workoutId, exerciseIdParam)
    : undefined;

  const instructions = exerciseIdParam
    ? await services.exercise.getExerciseInstructions(exerciseIdParam)
    : undefined;

  return {
    exercise,
    instructions,
    workoutId,
  };
};
