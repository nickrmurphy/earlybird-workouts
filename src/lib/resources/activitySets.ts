import { invalidate } from "$app/navigation";
import type {
  CountUnit,
  ActivitySet as IActivitySet,
  WeightUnit,
} from "$lib/database/database";
import { db, getClient } from "$lib/database/db";
import type { InferResult, InsertType } from "kysely";

const key: `${string}:${string}` = "data:activitySets";

type ActivitySet = {
  id: string;
  exerciseId: string;
  exerciseName: string;
  weight: number;
  weightUnit: WeightUnit;
  count: number;
  countUnit: CountUnit;
  isComplete: 0 | 1;
  activityId: string;
};

type ActivititySetsResponse = {
  key: `${string}:${string}`;
  activitySets: ActivitySet[];
};

type ActivitySetsOptions = {
  isComplete?: 0 | 1;
  workoutId?: string;
  activityId?: string;
  exerciseId?: string;
};

async function getActivitySets({
  workoutId,
  activityId,
  exerciseId,
  isComplete,
}: ActivitySetsOptions | undefined = {}): Promise<ActivititySetsResponse> {
  const client = await getClient();
  let query = db
    .selectFrom("activitySet")
    .orderBy("order", "asc")
    .select([
      "id",
      "exerciseId",
      "exerciseName",
      "count",
      "countUnit",
      "weight",
      "weightUnit",
      "activityId",
      "isComplete",
    ]);

  if (workoutId) {
    query = query.where("workoutId", "=", workoutId);
  }

  if (activityId) {
    query = query.where("activityId", "=", activityId);
  }

  if (exerciseId) {
    query = query.where("exerciseId", "=", exerciseId);
  }

  if (isComplete !== undefined) {
    query = query.where("isComplete", "=", isComplete);
  }

  const { sql, parameters } = query.compile();

  const activitySets = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);

  return {
    key,
    activitySets,
  };
}

async function createActivitySet(data: Omit<InsertType<IActivitySet>, "id">) {
  const id = crypto.randomUUID();
  const client = await getClient();
  const cmd = db.insertInto("activitySet").values({ ...data, id });
  const { sql, parameters } = cmd.compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(key);
    return id;
  });
}

async function updateActivitySet(
  id: string,
  data: Omit<Partial<InsertType<IActivitySet>>, "id">,
) {
  const client = await getClient();
  let cmd = db.updateTable("activitySet");

  if (data.weightUnit !== undefined) {
    cmd = cmd.set("weightUnit", data.weightUnit);
  }

  if (data.weight !== undefined) {
    cmd = cmd.set("weight", data.weight);
  }

  if (data.countUnit !== undefined) {
    cmd = cmd.set("countUnit", data.countUnit);
  }

  if (data.count !== undefined) {
    cmd = cmd.set("count", data.count);
  }

  if (data.isComplete !== undefined) {
    cmd = cmd.set("isComplete", data.isComplete);
  }

  const { sql, parameters } = cmd.where("id", "=", id).compile();

  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(key);
  });
}

async function deleteActivitySet(id: string) {
  const client = await getClient();
  const query = db.deleteFrom("activitySet").where("id", "=", id);
  const { sql, parameters } = query.compile();
  return await client.execute(sql, [...parameters]).then(() => {
    invalidate(key);
  });
}

export {
  createActivitySet,
  deleteActivitySet,
  getActivitySets,
  updateActivitySet,
};
export type { ActivitySet };
