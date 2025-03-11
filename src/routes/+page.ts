import { getWorkouts } from "$lib/resources";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends }) => {
  const { workouts, key } = await getWorkouts();

  depends(key);

  return {
    // TODO: return exercise names
    workouts: workouts.map((workout) => ({
      id: workout.id,
      name: workout.name,
      exercises: [],
    })),
  };
};
