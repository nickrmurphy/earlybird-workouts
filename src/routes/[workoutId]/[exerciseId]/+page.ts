import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

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
