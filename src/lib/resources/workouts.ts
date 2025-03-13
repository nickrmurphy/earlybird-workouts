import { invalidate } from "$app/navigation";
import type { Workout } from "$lib/database/database";
import { db, getClient } from "$lib/database/db";
import type { InferResult, InsertType } from "kysely";

const WORKOUT_KEY: `${string}:${string}` = "data:workout";

async function getWorkouts() {
  const client = await getClient();
  const query = db.selectFrom("workout").select(["id", "name"]);
  const { sql } = query.compile();
  const workouts = await client.select<InferResult<typeof query>>(sql);

  return {
    key: WORKOUT_KEY,
    workouts,
  };
}

async function getWorkout(id: string) {
  const client = await getClient();

  const query = db
    .selectFrom("workout")
    .select(["id", "name"])
    .where("id", "=", id);

  const { sql, parameters } = query.compile();
  const [workout] = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);

  return {
    key: WORKOUT_KEY,
    workout,
  };
}

async function createWorkout(data: Omit<InsertType<Workout>, "id">) {
  const id = crypto.randomUUID();
  const client = await getClient();
  const cmd = db.insertInto("workout").values({ ...data, id });
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(WORKOUT_KEY);
    return id;
  });
}

type PartialWorkout = Partial<InsertType<Workout>> &
  Omit<InsertType<Workout>, "id">;

async function updateWorkout(id: string, data: PartialWorkout) {
  const client = await getClient();
  let cmd = db.updateTable("workout").set(data).where("id", "=", id);

  if (data.name !== undefined) {
    cmd = cmd.set({ name: data.name });
  }

  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(WORKOUT_KEY);
  });
}

async function deleteWorkout(id: string) {
  const client = await getClient();
  const cmd = db.deleteFrom("workout").where("id", "=", id);
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(WORKOUT_KEY);
  });
}

export { createWorkout, deleteWorkout, getWorkout, getWorkouts, updateWorkout };
