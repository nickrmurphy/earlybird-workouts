import { invalidate } from "$app/navigation";
import type { WorkoutExercise } from "$lib/database/database";
import { db, getClient } from "$lib/database/db";
import { sql, type InferResult, type InsertType } from "kysely";

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
    .where("workoutExercise.workoutId", "=", id)
    .innerJoin("exercise", "exercise.id", "workoutExercise.exerciseId")
    .orderBy("workoutExercise.order")
    .select([
      "workoutExercise.id",
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

async function updateWorkoutExercise(
  id: string,
  data: Partial<InsertType<WorkoutExercise>>,
) {
  const client = await getClient();
  let cmd = db.updateTable("workoutExercise").set(data).where("id", "=", id);

  if (data.count !== undefined) {
    cmd = cmd.set("count", data.count);
  }

  if (data.countUnit !== undefined) {
    cmd = cmd.set("countUnit", data.countUnit);
  }

  if (data.sets !== undefined) {
    cmd = cmd.set("sets", data.sets);
  }

  if (data.weight !== undefined) {
    cmd = cmd.set("weight", data.weight);
  }

  if (data.weightUnit !== undefined) {
    cmd = cmd.set("weightUnit", data.weightUnit);
  }

  if (data.order !== undefined) {
    cmd = cmd.set("order", data.order);
  }

  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
  });
}

async function deleteWorkoutExercise(exerciseId: string) {
  const client = await getClient();
  const cmd = db
    .deleteFrom("workoutExercise")
    .where("workoutExercise.exerciseId", "=", exerciseId);
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
  });
}

async function updateWorkoutExercisesOrder(ids: string[]) {
  const client = await getClient();
  const cmds: string[] = ["BEGIN"];
  const params: (string | number)[] = [];

  ids.forEach((id, index) => {
    cmds.push(
      db
        .updateTable("workoutExercise")
        .set("order", sql`$${sql.raw((params.length + 1).toString())}`)
        .where(
          "id",
          "=",
          sql`$${sql.raw((params.length + 2).toString())}` as unknown as string,
        )
        .compile().sql,
    );
    params.push(index, id);
  });

  cmds.push("COMMIT");

  return await client.execute(cmds.join(";\n"), params).then(() => {
    invalidate(KEY);
  });
}

export {
  createWorkoutExercise,
  deleteWorkoutExercise,
  getWorkoutExercises,
  getWorkoutExercisesForWorkout,
  updateWorkoutExercise,
  updateWorkoutExercisesOrder,
};
