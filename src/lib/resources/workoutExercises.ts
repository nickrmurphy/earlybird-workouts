import { db, getClient } from "$lib/database/db";
import type { InferResult } from "kysely";

const KEY: `${string}:${string}` = "data:workout";

async function getWorkoutExercises() {
  const client = await getClient();
  const query = db.selectFrom("workoutExercise").selectAll();
  const { sql } = query.compile();
  const workoutExercises = await client.select<InferResult<typeof query>>(sql);

  return {
    key: KEY,
    workoutExercises,
  };
}

export { getWorkoutExercises };
