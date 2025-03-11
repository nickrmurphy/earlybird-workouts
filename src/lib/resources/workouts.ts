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

async function createWorkout(data: Omit<InsertType<Workout>, "id">) {
  const id = crypto.randomUUID();
  const client = await getClient();
  const cmd = db.insertInto("workout").values({ ...data, id });
  const { sql, parameters } = cmd.compile();
  console.log(sql);
  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(WORKOUT_KEY);
    return id;
  });
}

export { createWorkout, getWorkouts };
