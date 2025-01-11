import { services } from "$lib/services.svelte";
import type { Exercise } from "$lib/types";
import type { PageLoad } from "./$types";

export const load: PageLoad = async () => {
  const workouts = await services.workout.getWorkouts();
  const workoutExercises: Record<string, Exercise[]> = {};

  for (const workout of workouts) {
    workoutExercises[workout.id] = await services.workout.getExercises(
      workout.id,
    );
  }

  return { workouts, workoutExercises };
};
