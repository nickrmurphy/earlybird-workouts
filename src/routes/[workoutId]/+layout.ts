import { services } from "$lib/stores";
import type { LayoutLoad } from "./$types";

export const prerender = false;

export const load: LayoutLoad = async ({ params }) => {
  const workout = await services.workout.getWorkout(params.workoutId);

  const exercises = await services.workout.getExercises(params.workoutId);

  return { workout, exercises };
};
