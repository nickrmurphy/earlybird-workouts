import { getActivities, getActivitySets } from "$lib/resources";
import { calculateTonnagePerAttribute } from "$lib/utils";

import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends, params }) => {
  const { activities, key } = await getActivities(params.workoutId);
  const { activitySets, key: activitySetsKey } = await getActivitySets({
    workoutId: params.workoutId,
  });

  depends(key);
  depends(activitySetsKey);

  const successSets = activitySets.filter(
    (set) => activities.some((h) => h.id === set.activityId) && set.isComplete,
  );

  const tonnage: Map<string, number> = calculateTonnagePerAttribute(
    successSets,
    (set) => set.activityId,
  );

  return {
    activities,
    activitySets,
    tonnage,
  };
};
