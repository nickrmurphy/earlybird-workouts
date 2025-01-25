import { services } from "$lib/stores";
import { redirect } from "@sveltejs/kit";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params }) => {
  const activeWorkout =
    await services.workoutHistory.getPendingWorkoutHistory();

  if (!activeWorkout) {
    redirect(303, "/");
  }

  const exerciseSets =
    await services.workoutHistory.getExerciseWorkoutHistorySets(
      activeWorkout.id,
      params.exerciseId,
    );

  const exercise = await services.exercise.getExercise(params.exerciseId);

  return {
    exercise,
    exerciseSets,
  };
};
