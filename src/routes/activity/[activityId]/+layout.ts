import { getActivity, getActivitySets, type ActivitySet } from "$lib/resources";
import { redirect } from "@sveltejs/kit";
import type { LayoutLoad } from "../$types";

export const prerender = false;

type Exercise = {
  id: string;
  name: string;
};

type ExerciseSets = Record<Exercise["id"], Exercise & { sets: ActivitySet[] }>;

export const load: LayoutLoad = async ({ params, depends }) => {
  if (!params.activityId) {
    redirect(303, "/");
  }

  const { key: activityKey, activity } = await getActivity(params.activityId);
  const { key: activitySetsKey, activitySets } = await getActivitySets({
    activityId: params.activityId,
  });

  depends(activityKey);
  depends(activitySetsKey);

  const exerciseIds = new Set<string>();
  const exerciseSets: ExerciseSets = {};

  for (const set of activitySets) {
    if (!exerciseSets[set.exerciseId]) {
      exerciseSets[set.exerciseId] = {
        id: set.exerciseId,
        name: set.exerciseName,
        sets: [set],
      };
    }
    exerciseSets[set.exerciseId].sets.push(set);
    exerciseIds.add(set.exerciseId);
  }

  return {
    activity,
    exerciseSets,
    exerciseIds: Array.from(exerciseIds),
  };
};
