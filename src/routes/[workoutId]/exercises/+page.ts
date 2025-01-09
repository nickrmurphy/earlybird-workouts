import { services } from "$lib/services.svelte";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ url }) => {
  const queriedExercises = await services.exercise.queryExercises({
    name: url.searchParams.get("name") || undefined,
  });
  console.log("queriedExercises", queriedExercises);
  return { queriedExercises };
};
