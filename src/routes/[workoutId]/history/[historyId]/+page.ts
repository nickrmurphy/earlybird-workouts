import { getActivity, getActivitySets } from "$lib/resources";
import { getDistinctExercises } from "$lib/utils";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends, params }) => {
  const { activitySets, key } = await getActivitySets({
    activityId: params.historyId,
  });

  const { activity, key: activityKey } = await getActivity(params.historyId);

  depends(key);
  depends(activityKey);

  return {
    activity,
    activitySets,
    exercises: getDistinctExercises(activitySets),
  };
};
