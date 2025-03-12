import type { CountUnit, WeightUnit } from "$lib/database/database";
import { db, getClient } from "$lib/database/db";
import type { InferResult } from "kysely";

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
  activitySets: {
    id: string;
    exerciseId: string;
    exerciseName: string;
    weight: number;
    weightUnit: WeightUnit;
    count: number;
    countUnit: CountUnit;
    isComplete: 0 | 1;
    activityId: string;
  }[];
};

type ActivitySetsWorkoutIdOption = {
  workoutId: string;
  activityId?: never;
};

type ActivitySetsActivityIdOption = {
  workoutId?: never;
  activityId: string;
};

type ActivitySetsOptions =
  | ActivitySetsWorkoutIdOption
  | ActivitySetsActivityIdOption;

async function getActivitySets({
  workoutId,
  activityId,
}: ActivitySetsOptions): Promise<ActivititySetsResponse> {
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

  const { sql, parameters } = query.compile();

  const activitySets = await client.select<InferResult<typeof query>>(sql, [
    ...parameters,
  ]);

  return {
    key,
    activitySets,
  };
}

export { getActivitySets };
export type { ActivitySet };
