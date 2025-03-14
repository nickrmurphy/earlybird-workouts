import { getActivities, getActivitySets } from "$lib/resources";
import { calculateTonnagePerAttribute } from "$lib/utils";

import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends, params }) => {
  const { activities, key } = await getActivities(params.workoutId);
  const { activitySets, key: activitySetsKey } = await getActivitySets({
    workoutId: params.workoutId,
    isComplete: 1,
  });

  depends(key);
  depends(activitySetsKey);

  const tonnage: Map<string, number> = calculateTonnagePerAttribute(
    activitySets,
    (set) => set.activityId,
  );

  return {
    activities,
    activitySets,
    tonnage,
  };
};
