import { invalidate } from "$app/navigation";
import { db, getClient } from "$lib/database/db";
import { sql, type InferResult } from "kysely";

type Activity = {
  id: string;
  workoutId: string;
  workoutName: string;
  startTime: Date;
  endTime?: Date | undefined;
};

const KEY: `${string}:${string}` = "data:activity";

async function getActivities(workoutId?: string): Promise<{
  key: `${string}:${string}`;
  activities: Activity[];
}> {
  const client = await getClient();
  let query = db
    .selectFrom("activity")
    .orderBy("startTime", "desc")
    .select(["id", "workoutId", "workoutName", "startTime", "endTime"]);

  if (workoutId) {
    query = query.where("workoutId", "=", workoutId);
  }

  const { sql, parameters } = query.compile();

  const activitiesData = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);

  return {
    key: KEY,
    activities: activitiesData.map((activity) => ({
      id: activity.id,
      workoutId: activity.workoutId,
      workoutName: activity.workoutName,
      startTime: new Date(activity.startTime),
      endTime: activity.endTime ? new Date(activity.endTime) : undefined,
    })),
  };
}

async function getActivity(activityId: string): Promise<{
  key: `${string}:${string}`;
  activity: Activity;
}> {
  const client = await getClient();
  const query = db
    .selectFrom("activity")
    .where("id", "=", activityId)
    .select(["id", "workoutId", "workoutName", "startTime", "endTime"]);
  const { sql, parameters } = query.compile();
  const [activityData] = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);
  return {
    key: KEY,
    activity: {
      id: activityData.id,
      workoutId: activityData.workoutId,
      workoutName: activityData.workoutName,
      startTime: new Date(activityData.startTime),
      endTime: activityData.endTime
        ? new Date(activityData.endTime)
        : undefined,
    },
  };
}

async function deleteActivity(id: string) {
  const client = await getClient();
  const query = db.deleteFrom("activity").where("id", "=", id);
  const { sql, parameters } = query.compile();
  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
  });
}

async function createActivityAndSets({ workoutId }: { workoutId: string }) {
  const id = crypto.randomUUID();
  const client = await getClient();

  const workoutQuery = db
    .selectFrom("workout")
    .where("id", "=", workoutId)
    .select(["name"]);
  const { sql: workoutSql, parameters: workoutParameters } =
    workoutQuery.compile();
  const [workout] = await client.select<InferResult<typeof workoutQuery>>(
    workoutSql,
    [...workoutParameters],
  );

  if (!workout) {
    throw new Error("Workout not found");
  }
  const workoutExerciseQuery = db
    .selectFrom("workoutExercise")
    .where("workoutId", "=", workoutId)
    .selectAll()
    .innerJoin("exercise", "exercise.id", "workoutExercise.exerciseId")
    .select("exercise.name as exerciseName");

  const { sql: workoutExerciseSql, parameters: workoutExerciseParameters } =
    workoutExerciseQuery.compile();

  const workoutExercises = await client.select<
    InferResult<typeof workoutExerciseQuery>
  >(workoutExerciseSql, [...workoutExerciseParameters]);

  const activityCmd = db.insertInto("activity").values({
    id,
    workoutId,
    startTime: sql`CURRENT_TIMESTAMP`,
    workoutName: workout.name,
  });

  const { sql: activitySql, parameters: activityParameters } =
    activityCmd.compile();

  await client.execute(activitySql, [...activityParameters]);

  for (const exercise of workoutExercises) {
    for (let i = 0; i < exercise.sets; i++) {
      const activitySetId = crypto.randomUUID();

      const setCmd = db.insertInto("activitySet").values({
        id: activitySetId,
        activityId: id,
        workoutId: workoutId,
        workoutName: workout.name,
        exerciseId: exercise.exerciseId,
        exerciseName: exercise.exerciseName,
        count: exercise.count,
        countUnit: exercise.countUnit,
        weight: exercise.weight,
        weightUnit: exercise.weightUnit,
        order: i,
        isComplete: 0,
      });

      const { sql: setSql, parameters: setParameters } = setCmd.compile();
      await client.execute(setSql, [...setParameters]);
    }
  }

  invalidate(KEY);
  return id;
}

async function updateActivity(id: string, data: { endTime: string }) {
  const client = await getClient();
  const query = db
    .updateTable("activity")
    .set("endTime", data.endTime)
    .where("id", "=", id);
  const { sql, parameters } = query.compile();
  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(KEY);
  });
}

export {
  createActivityAndSets,
  deleteActivity,
  getActivities,
  getActivity,
  updateActivity,
};
