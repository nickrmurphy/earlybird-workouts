import { services } from "$lib/services.svelte";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params }) => {
  const workout = await services.workout.getWorkout(Number(params.workoutId));
  const exercises = await services.workout.getExercises(
    Number(params.workoutId)
  );

  return { exercises, workout };
};
