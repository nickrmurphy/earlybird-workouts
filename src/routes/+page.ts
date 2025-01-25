import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async () => {
  const workouts = await services.workouts.all();

  return { workouts };
};
