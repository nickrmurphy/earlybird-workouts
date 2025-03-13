import { invalidate } from "$app/navigation";
import type { WorkoutExercise } from "$lib/database/database";
import { db, getClient } from "$lib/database/db";
import type { InferResult, InsertType } from "kysely";

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

async function createWorkoutExercise(
  data: Omit<InsertType<WorkoutExercise>, "id">,
) {
  const id = crypto.randomUUID();
  const client = await getClient();
  const cmd = db.insertInto("workoutExercise").values({ ...data, id });
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
    return id;
  });
}

async function deleteWorkoutExercise(id: string) {
  const client = await getClient();
  const cmd = db.deleteFrom("workoutExercise").where("id", "=", id);
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
    return id;
  });
}

export {
  createWorkoutExercise,
  deleteWorkoutExercise,
  getWorkoutExercises,
  getWorkoutExercisesForWorkout,
};
