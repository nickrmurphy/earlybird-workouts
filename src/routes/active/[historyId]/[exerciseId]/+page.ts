import { redirect } from "@sveltejs/kit";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ parent, params }) => {
  const parentData = await parent();

  const details = parentData.allExercises.find(
    (e) => e.id === params.exerciseId,
  );

  return {
    details: details ? details : redirect(404, "/"),
  };
};
