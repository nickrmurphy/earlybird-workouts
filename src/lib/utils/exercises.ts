import type { Equipment, Exercise, Muscle } from "$lib/db";

function isNameMatch(exercise: Exercise, term: string) {
  return exercise.name.toLowerCase().includes(term.trim().toLowerCase());
}

function isMuscleMatch(exercise: Exercise, muscleIds: Muscle[]) {
  return (
    muscleIds.length === 0 ||
    muscleIds.some(
      (id) =>
        exercise.primaryMuscles?.includes(id) ||
        exercise.secondaryMuscles?.includes(id),
    )
  );
}

function isEquipmentMatch(exercise: Exercise, equipmentIds: Equipment[]) {
  return (
    equipmentIds.length === 0 ||
    equipmentIds.some((id) => exercise.equipment?.includes(id))
  );
}

export { isEquipmentMatch, isMuscleMatch, isNameMatch };
