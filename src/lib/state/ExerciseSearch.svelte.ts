import type { Equipment, Exercise, Muscle } from "$lib/db";

type FilterOptions = {
  term: string;
  equipmentIds: Equipment[];
  muscleIds: Muscle[];
  custom?: (exercise: Exercise) => boolean;
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
  customFilter: (exercise: Exercise) => boolean = $state(() => true);

  filteredOptions = $derived.by(() => {
    return getFilteredExercises(this.#options, {
      term: this.term,
      equipmentIds: this.equipmentIds,
      muscleIds: this.muscleIds,
      custom: this.customFilter,
    });
  });

  constructor(options: Exercise[]) {
    this.#options = options;
  }
}
