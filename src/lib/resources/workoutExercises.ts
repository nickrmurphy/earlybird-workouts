import { invalidate } from "$app/navigation";
import type { WorkoutExercise } from "$lib/database/database";
import { db } from "$lib/database/db";
import { type InsertType } from "kysely";

const KEY: `${string}:${string}` = "data:workout";

async function getWorkoutExercises() {
  const workoutExercises = await db
    .selectFrom("workoutExercise")
    .innerJoin("exercise", "workoutExercise.exerciseId", "exercise.id")
    .select([
      "workoutExercise.id",
      "workoutExercise.workoutId",
      "workoutExercise.exerciseId",
      "exercise.name as exerciseName",
      "workoutExercise.weight",
      "workoutExercise.weightUnit",
      "workoutExercise.count",
      "workoutExercise.countUnit",
      "workoutExercise.order",
      "workoutExercise.sets",
    ]).execute();

  return {
    key: KEY,
    workoutExercises,
  };
}
async function getWorkoutExercisesForWorkout(id: string) {
  const workoutExercises = await db
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
    ])
    .execute();

  return {
    key: KEY,
    workoutExercises,
  };
}

async function createWorkoutExercise(
  data: Omit<InsertType<WorkoutExercise>, "id">,
) {
  const id = crypto.randomUUID();

  await db
    .insertInto("workoutExercise")
    .values({ ...data, id })
    .execute();

  invalidate(KEY);
  return id;
}

async function updateWorkoutExercise(
  id: string,
  data: Partial<InsertType<WorkoutExercise>>,
) {
  await db
    .updateTable("workoutExercise")
    .set(data)
    .where("id", "=", id)
    .execute();

  invalidate(KEY);
}

async function deleteWorkoutExercise(exerciseId: string) {
  await db
    .deleteFrom("workoutExercise")
    .where("workoutExercise.exerciseId", "=", exerciseId)
    .execute();

  invalidate(KEY);
}

async function updateWorkoutExercisesOrder(ids: string[]) {
  // Use a transaction for multiple updates
  await db.transaction().execute(async (trx) => {
    for (let i = 0; i < ids.length; i++) {
      await trx
        .updateTable("workoutExercise")
        .set({ order: i })
        .where("id", "=", ids[i])
        .execute();
    }
  });

  invalidate(KEY);
}

export {
  createWorkoutExercise,
  deleteWorkoutExercise,
  getWorkoutExercises,
  getWorkoutExercisesForWorkout,
  updateWorkoutExercise,
  updateWorkoutExercisesOrder,
};
