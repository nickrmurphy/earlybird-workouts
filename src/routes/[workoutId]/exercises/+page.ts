import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ parent }) => {
  const { allExercises, workoutExercises } = await parent();

  const selectedExerciseIds = new Set(
    workoutExercises.map((e) => e.exerciseId),
  );

  const selectedExercises = allExercises.filter((exercise) =>
    selectedExerciseIds.has(exercise.id),
  );

  return {
    selectedExercises,
    selectedExerciseIds,
  };
};
