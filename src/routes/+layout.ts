// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)
// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

import { goto } from "$app/navigation";
import { services } from "$lib/stores";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async ({ url }) => {
  const activeWorkout =
    await services.workoutHistory.getPendingWorkoutHistory();

  if (activeWorkout && !url.pathname.startsWith("/active")) {
    goto("/active");
  }
};
