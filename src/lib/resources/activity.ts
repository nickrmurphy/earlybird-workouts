import { db, getClient } from "$lib/database/db";
import type { InferResult } from "kysely";

type Activity = {
  id: string;
  workoutId: string;
  workoutName: string;
  startTime: Date;
  endTime?: Date | undefined;
};

const key: `${string}:${string}` = "data:activity";

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
    key,
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
    key,
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
export { getActivities, getActivity };
