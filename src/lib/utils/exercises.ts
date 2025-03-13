import type { ActivitySet, ExerciseDetail } from "$lib/resources";

function isNameMatch(exercise: { exerciseName: string }, term: string) {
  return exercise.exerciseName
    .toLowerCase()
    .includes(term.trim().toLowerCase());
}

function isMuscleMatch(exercise: ExerciseDetail, muscleIds: string[]) {
  return (
    muscleIds.length === 0 ||
    muscleIds.some((id) => exercise.muscles.some((m) => m.id === id))
  );
}

function isEquipmentMatch(exercise: ExerciseDetail, equipmentIds: string[]) {
  return (
    equipmentIds.length === 0 ||
    equipmentIds.some((id) => exercise.equipment.id === id)
  );
}

function getDistinctExercises(activitySets: ActivitySet[]) {
  const exercisesMap: Map<
    string,
    {
      id: string;
      exerciseId: string;
      exerciseName: string;
      activityId: string;
    }
  > = new Map();

  for (const set of activitySets || []) {
    if (!exercisesMap.has(set.exerciseId)) {
      exercisesMap.set(set.exerciseId, {
        id: set.id,
        exerciseId: set.exerciseId,
        exerciseName: set.exerciseName,
        activityId: set.activityId,
      });
    }
  }

  return Array.from(exercisesMap.values());
}

export { getDistinctExercises, isEquipmentMatch, isMuscleMatch, isNameMatch };
