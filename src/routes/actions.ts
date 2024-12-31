import { invalidateAll } from "$app/navigation";
import { db } from "$lib/db.svelte";

export const createWorkout = async (name: string) => {
  const result = await db.earlybird.execute(
    "INSERT INTO workouts (name) VALUES ($1)",
    [name]
  );
  invalidateAll();
  return result.lastInsertId;
};
