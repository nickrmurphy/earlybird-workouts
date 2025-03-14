import type { ActivitySet } from "$lib/resources";

type Exercise = {
  id: string;
  name: string;
};

type ExerciseSets = Record<Exercise["id"], Exercise & { sets: ActivitySet[] }>;

function groupExerciseSets(sets: ActivitySet[]) {
  const exerciseSets: ExerciseSets = {};
  const exerciseIds = new Set<string>();

  for (const set of sets) {
    if (!exerciseSets[set.exerciseId]) {
      exerciseSets[set.exerciseId] = {
        id: set.exerciseId,
        name: set.exerciseName,
        sets: [set],
      };
    }
    exerciseIds.add(set.exerciseId);
    exerciseSets[set.exerciseId].sets.push(set);
  }

  return { exerciseSets, exerciseIds: Array.from(exerciseIds) };
}

export { groupExerciseSets };
