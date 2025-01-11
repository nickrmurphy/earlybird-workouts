import { services } from "$lib/stores";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async ({ params }) => {
  const workoutHistory = await services.workoutHistory.getWorkoutHistories(
    Number(params.workoutId),
  );
  return { workoutHistory };
};
