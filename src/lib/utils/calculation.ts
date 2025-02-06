import type { HistorySet } from "../db";

function calculateTonnage(sets: HistorySet[]): number {
  return sets.reduce(
    (acc, set) => acc + (set.isSuccess ? set.count * set.weight : 0),
    0,
  );
}

function calculateTonnagePerAttribute<T extends string | number>(
  sets: HistorySet[],
  predicate: (set: HistorySet) => T,
): Map<T, number> {
  const tonnagePerExercise = new Map<T, number>();
  sets.forEach((set) => {
    const key = predicate(set);
    const value = tonnagePerExercise.get(key) || 0;
    tonnagePerExercise.set(
      key,
      value + (set.isSuccess ? set.count * set.weight : 0),
    );
  });
  return tonnagePerExercise;
}

export { calculateTonnage, calculateTonnagePerAttribute };
