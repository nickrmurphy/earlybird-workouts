import { getExercises } from "$lib/resources";
import type { LayoutLoad } from "../$types";

export const load: LayoutLoad = async () => {
  const allExercises = await getExercises();
  return { allExercises };
};
