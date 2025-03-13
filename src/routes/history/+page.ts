import { getActivities, getActivitySets } from "$lib/resources";
import { calculateTonnagePerAttribute } from "$lib/utils";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ depends }) => {
  const [
    { key, activities },
    { key: activitySetsKey, activitySets },
    { key: completeActivitySetsKey, activitySets: completeActivitySets },
  ] = await Promise.all([
    getActivities(),
    getActivitySets({}),
    getActivitySets({ isComplete: 1 }),
  ]);

  depends(key);
  depends(activitySetsKey);
  depends(completeActivitySetsKey);

  return {
    activitySets,
    activities,
    tonnage: calculateTonnagePerAttribute(
      completeActivitySets,
      (set) => set.activityId,
    ),
  };
};
