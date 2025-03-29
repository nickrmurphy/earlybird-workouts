import { invalidate } from "$app/navigation";
import type { Workout } from "$lib/database/database";
import { db } from "$lib/database/db";
import type { InsertType } from "kysely";

const WORKOUT_KEY: `${string}:${string}` = "data:workout";

async function getWorkouts() {
  const workouts = await db.selectFrom("workout").select(["id", "name"])
    .execute();

  return {
    key: WORKOUT_KEY,
    workouts,
  };
}

async function getWorkout(id: string) {
  const workout = await db
    .selectFrom("workout")
    .select(["id", "name"])
    .where("id", "=", id)
    .executeTakeFirst();

  return {
    key: WORKOUT_KEY,
    workout,
  };
}

async function createWorkout(data: Omit<InsertType<Workout>, "id">) {
  const id = crypto.randomUUID();

  await db.insertInto("workout")
    .values({ ...data, id })
    .execute();

  invalidate(WORKOUT_KEY);
  return id;
}

type PartialWorkout =
  & Partial<InsertType<Workout>>
  & Omit<InsertType<Workout>, "id">;

async function updateWorkout(id: string, data: PartialWorkout) {
  let query = db.updateTable("workout").where("id", "=", id);

  if (data.name !== undefined) {
    query = query.set({ name: data.name });
  } else {
    query = query.set(data);
  }

  await query.execute();
  invalidate(WORKOUT_KEY);
}

async function deleteWorkout(id: string) {
  await db.deleteFrom("workout")
    .where("id", "=", id)
    .execute();

  invalidate(WORKOUT_KEY);
}

export { createWorkout, deleteWorkout, getWorkout, getWorkouts, updateWorkout };
