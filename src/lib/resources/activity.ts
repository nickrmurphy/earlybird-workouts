import { invalidate } from "$app/navigation";
import { db } from "$lib/database/db";
import { sql } from "kysely";

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
  let query = db
    .selectFrom("activity")
    .orderBy("startTime", "desc")
    .select(["id", "workoutId", "workoutName", "startTime", "endTime"]);

  if (workoutId) {
    query = query.where("workoutId", "=", workoutId);
  }

  const activitiesData = await query.execute();

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
  const activityData = await db
    .selectFrom("activity")
    .where("id", "=", activityId)
    .select(["id", "workoutId", "workoutName", "startTime", "endTime"])
    .executeTakeFirstOrThrow();

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
  return db
    .deleteFrom("activity")
    .where("id", "=", id)
    .execute().then(() => {
      invalidate(KEY);
    });
}

async function createActivityAndSets({ workoutId }: { workoutId: string }) {
  const id = crypto.randomUUID();

  const workout = await db
    .selectFrom("workout")
    .where("id", "=", workoutId)
    .select(["name"])
    .executeTakeFirstOrThrow();

  const workoutExercises = await db
    .selectFrom("workoutExercise")
    .where("workoutId", "=", workoutId)
    .selectAll()
    .innerJoin("exercise", "exercise.id", "workoutExercise.exerciseId")
    .select("exercise.name as exerciseName")
    .execute();

  db.transaction().execute(async (trx) => {
    trx.insertInto("activity")
      .values({
        id,
        workoutId,
        startTime: sql`(strftime('%Y-%m-%dT%H:%M:%SZ', 'now'))`,
        workoutName: workout.name,
      })
      .execute();

    for (const exercise of workoutExercises) {
      for (let i = 0; i < exercise.sets; i++) {
        const activitySetId = crypto.randomUUID();
        await trx.insertInto("activitySet").values({
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
        }).execute();
      }
    }
  });

  invalidate(KEY);
  return id;
}

async function updateActivity(id: string, data: { endTime: string }) {
  await db
    .updateTable("activity")
    .set("endTime", data.endTime)
    .where("id", "=", id)
    .execute()
    .then(() => {
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
