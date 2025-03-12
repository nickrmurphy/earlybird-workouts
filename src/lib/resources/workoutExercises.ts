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

async function getWorkoutExercisesForWorkout(id: string) {
  const client = await getClient();
  const query = db
    .selectFrom("workoutExercise")
    .where("workoutExercise.exerciseId", "=", id)
    .innerJoin("exercise", "exercise.id", "workoutExercise.exerciseId")
    .orderBy("workoutExercise.order")
    .select([
      "id",
      "sets",
      "count",
      "countUnit",
      "weight",
      "weightUnit",
      "exerciseId",
      "exercise.name as exerciseName",
    ]);

  const { sql, parameters } = query.compile();

  const workoutExercises = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);

  return {
    key: KEY,
    workoutExercises,
  };
}

export { getWorkoutExercises, getWorkoutExercisesForWorkout };
