import { services } from "$lib/services.svelte";
import { redirect } from "@sveltejs/kit";
import type { LayoutLoad } from "../$types";

export const load: LayoutLoad = async () => {
  const activeWorkout =
    await services.workoutHistory.getPendingWorkoutHistory();

  if (!activeWorkout) {
    redirect(303, "/");
  }

  const workoutExercises =
    await services.workoutHistory.getWorkoutHistoryExercises(activeWorkout.id);
  console.log(workoutExercises);
  return { activeWorkout, workoutExercises };
};
