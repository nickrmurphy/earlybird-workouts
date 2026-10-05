import type { Equipment, Exercise, Muscle } from "$lib/db";
import { isEquipmentMatch, isMuscleMatch, isNameMatch } from "$lib/utils";
import { useDeferredValue, useMemo, useState } from "react";

function useExerciseSearch(exercises: Exercise[]) {
  const [term, setTerm] = useState("");
  const [muscleIds, setMuscleIds] = useState<Muscle[]>([]);
  const [equipmentIds, setEquipmentIds] = useState<Equipment[]>([]);

  // Filtering ~15k exercises; let typing stay responsive
  const deferredTerm = useDeferredValue(term);

  const filteredOptions = useMemo(
    () =>
      exercises.filter(
        (exercise) =>
          isNameMatch(exercise, deferredTerm) &&
          isMuscleMatch(exercise, muscleIds) &&
          isEquipmentMatch(exercise, equipmentIds),
      ),
    [exercises, deferredTerm, muscleIds, equipmentIds],
  );

  return {
    term,
    setTerm,
    muscleIds,
    setMuscleIds,
    equipmentIds,
    setEquipmentIds,
    filteredOptions,
  };
}

export { useExerciseSearch };
