import type { Equipment, Exercise, Muscle } from "$lib/schema";

type FilterOptions = {
  term: string;
  equipmentIds: Equipment[];
  muscleIds: Muscle[];
};

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

function filterExercise(exercise: Exercise, filters: FilterOptions) {
  const nameMatch = isNameMatch(exercise, filters.term);
  const muscleMatch = isMuscleMatch(exercise, filters.muscleIds);
  const equipmentMatch = isEquipmentMatch(exercise, filters.equipmentIds);
  return nameMatch && muscleMatch && equipmentMatch;
}

function getFilteredExercises(options: Exercise[], filters: FilterOptions) {
  return options.filter((exercise) => filterExercise(exercise, filters));
}

export class ExerciseSearch {
  #options: Exercise[];
  term = $state("");
  equipmentIds = $state<Equipment[]>([]);
  muscleIds = $state<Muscle[]>([]);

  filteredOptions = $derived.by(() => {
    return getFilteredExercises(this.#options, {
      term: this.term,
      equipmentIds: this.equipmentIds,
      muscleIds: this.muscleIds,
    });
  });

  constructor(options: Exercise[]) {
    this.#options = options;
  }
}
