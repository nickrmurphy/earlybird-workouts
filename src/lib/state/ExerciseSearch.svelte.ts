import type { Equipment, Exercise, Muscle } from "$lib/db";
import { isEquipmentMatch, isMuscleMatch, isNameMatch } from "$lib/utils";

type FilterOptions = {
  term: string;
  equipmentIds: Equipment[];
  muscleIds: Muscle[];
  custom?: (exercise: Exercise) => boolean;
};

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
