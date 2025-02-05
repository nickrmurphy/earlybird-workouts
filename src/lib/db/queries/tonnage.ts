import type { HistorySet } from "..";

function calculateTonnage(sets: HistorySet[]): number {
  return sets.reduce(
    (acc, set) => acc + (set.isSuccess ? set.count * set.weight : 0),
    0,
  );
}
