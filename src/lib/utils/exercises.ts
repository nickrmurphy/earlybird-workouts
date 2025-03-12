import type { ExerciseDetail } from "$lib/resources";

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

export { isEquipmentMatch, isMuscleMatch, isNameMatch };
