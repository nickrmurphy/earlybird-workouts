import { getWorkoutExercises, getWorkouts } from "$lib/resources";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends }) => {
  const { workouts, key } = await getWorkouts();
  const { workoutExercises, key: workoutExerciseKey } =
    await getWorkoutExercises();

  depends(key);
  depends(workoutExerciseKey);

  const groupedExercises = Object.groupBy(
    workoutExercises,
    (we) => we.workoutId,
  );

  return {
    workouts: workouts.map((workout) => ({
      id: workout.id,
      name: workout.name,
      exercises:
        groupedExercises[workout.id]?.map((we) => we.exerciseName) || [],
    })),
  };
};
