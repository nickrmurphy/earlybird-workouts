import { services } from "$lib/stores";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async ({ params }) => {
  const workoutHistory = await services.workoutHistory.getWorkoutHistories(
    params.workoutId,
  );
  return { workoutHistory };
};
