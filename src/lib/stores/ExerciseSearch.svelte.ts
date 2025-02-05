import type { Equipment, Exercise, Muscle } from "$lib/schema";

export class ExerciseSearch {
  #options: Exercise[] = [];
  searchTerm = $state("");
  equipmentIdFilters = $state<Equipment[]>([]);
  muscleIdFilters = $state<Muscle[]>([]);

  filteredOptions = $derived.by(() => {
    return this.#options.filter((exercise) => {
      const nameFilter = this.searchTerm.trim();
      let nameMatch = true;
      let muscleMatch = true;
      let equipmentMatch = true;

      if (nameFilter) {
        nameMatch = exercise.name
          .toLowerCase()
          .includes(nameFilter.toLowerCase());
      }

      if (this.equipmentIdFilters.length > 0) {
        equipmentMatch = this.equipmentIdFilters.some((equipmentId) =>
          exercise.equipment?.includes(equipmentId),
        );
      }

      if (this.muscleIdFilters.length > 0) {
        muscleMatch = this.muscleIdFilters.some(
          (muscleId) =>
            exercise.primaryMuscles.includes(muscleId) ||
            exercise.secondaryMuscles.includes(muscleId),
        );
      }

      return nameMatch && muscleMatch && equipmentMatch;
    });
  });

  constructor(options: Exercise[]) {
    this.#options = options;
  }
}
