import { services } from "$lib/services.svelte";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async ({ params }) => {
  const workoutHistory = await services.workoutHistory.getWorkoutHistories(
    Number(params.workoutId),
  );
  return { workoutHistory };
};
