import { getActivities, getActivitySets } from "$lib/resources";

import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends, params }) => {
  const { activities, key } = await getActivities(params.workoutId);
  const { activitySets, key: activitySetsKey } = await getActivitySets({
    workoutId: params.workoutId,
  });

  depends(key);
  depends(activitySetsKey);

  return {
    activities,
    activitySets,
  };
};
