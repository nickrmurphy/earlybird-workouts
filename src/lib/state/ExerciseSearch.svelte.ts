import type { ExerciseDetail } from "$lib/resources";
import { isEquipmentMatch, isMuscleMatch, isNameMatch } from "$lib/utils";

type FilterOptions = {
  term: string;
  equipmentIds: string[];
  muscleIds: string[];
  custom?: (exercise: ExerciseDetail) => boolean;
};

function filterExercise(exercise: ExerciseDetail, filters: FilterOptions) {
  const nameMatch = isNameMatch(exercise, filters.term);
  const muscleMatch = isMuscleMatch(exercise, filters.muscleIds);
  const equipmentMatch = isEquipmentMatch(exercise, filters.equipmentIds);
  return nameMatch && muscleMatch && equipmentMatch;
}

function getFilteredExercises(
  options: ExerciseDetail[],
  filters: FilterOptions,
) {
  return options.filter((exercise) => filterExercise(exercise, filters));
}

export class ExerciseSearch {
  #options: ExerciseDetail[];
  term = $state("");
  equipmentIds = $state<string[]>([]);
  muscleIds = $state<string[]>([]);
  customFilter: (exercise: ExerciseDetail) => boolean = $state(() => true);

  filteredOptions = $derived.by(() => {
    return getFilteredExercises(this.#options, {
      term: this.term,
      equipmentIds: this.equipmentIds,
      muscleIds: this.muscleIds,
      custom: this.customFilter,
    });
  });

  constructor(options: ExerciseDetail[]) {
    this.#options = options;
  }
}
