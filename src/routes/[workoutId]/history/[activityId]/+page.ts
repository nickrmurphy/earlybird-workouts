import { getActivity, getActivitySets } from "$lib/resources";
import {
  calculateTonnage,
  dateDifferenceInMinutes,
  getDistinctExercises,
} from "$lib/utils";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends, params }) => {
  const { activitySets, key } = await getActivitySets({
    activityId: params.activityId,
  });

  const { activity, key: activityKey } = await getActivity(params.activityId);

  const runTime = activity.endTime
    ? dateDifferenceInMinutes(activity.startTime, activity.endTime)
    : undefined;

  depends(key);
  depends(activityKey);

  return {
    activity,
    activitySets,
    runTime,
    tonnage: calculateTonnage(activitySets),
    exercises: getDistinctExercises(activitySets),
  };
};
