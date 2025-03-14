import { goto } from "$app/navigation";
import { getExercises } from "$lib/resources";
import { globalState } from "$lib/state";
import type { LayoutLoad } from "../$types";

export const load: LayoutLoad = async () => {
  const activeWorkout = globalState.activity.currentId;

  if (!activeWorkout) {
    goto("/");
  }

  const allExercises = await getExercises();
  return { allExercises };
};
