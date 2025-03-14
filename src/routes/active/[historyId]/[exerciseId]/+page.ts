import { getActivitySets } from "$lib/resources";
import { redirect } from "@sveltejs/kit";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ parent, params, depends }) => {
  const parentData = await parent();

  const details = parentData.allExercises.find(
    (e) => e.id === params.exerciseId,
  );

  const { key, activitySets } = await getActivitySets({
    exerciseId: params.exerciseId,
    activityId: params.historyId,
  });

  depends(key);

  return {
    activitySets,
    details: details ? details : redirect(404, "/"),
  };
};
