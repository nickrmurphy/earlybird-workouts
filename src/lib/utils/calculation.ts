import type { ActivitySet } from "$lib/resources";

function kgToLbs(kg: number): number {
  return kg * 2.20462;
}

function getCalcWeight(set: ActivitySet): number {
  return set.weightUnit === "lb" ? set.weight : kgToLbs(set.weight);
}

// TODO: Handle different weight units (kg vs lb)
function calculateTonnage(sets: ActivitySet[]): number {
  return sets.reduce(
    (acc, set) => acc + (set.isComplete ? set.count * getCalcWeight(set) : 0),
    0,
  );
}

// TODO: Handle different weight units (kg vs lb)
function calculateTonnagePerAttribute<T extends string | number>(
  sets: ActivitySet[],
  predicate: (set: ActivitySet) => T,
): Map<T, number> {
  const tonnagePerExercise = new Map<T, number>();
  sets.forEach((set) => {
    const key = predicate(set);
    const value = tonnagePerExercise.get(key) || 0;
    tonnagePerExercise.set(
      key,
      value + (set.isComplete ? set.count * getCalcWeight(set) : 0),
    );
  });
  return tonnagePerExercise;
}

export { calculateTonnage, calculateTonnagePerAttribute };
