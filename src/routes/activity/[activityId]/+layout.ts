import { getActivity, getActivitySets } from "$lib/resources";
import { groupExerciseSets } from "$lib/utils";
import { redirect } from "@sveltejs/kit";
import type { LayoutLoad } from "../$types";

export const prerender = false;

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

  const { exerciseIds, exerciseSets } = groupExerciseSets(activitySets);

  return {
    activity,
    exerciseSets,
    exerciseIds,
  };
};
