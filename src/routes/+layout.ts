// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)

import { globalState } from "$lib/state";
import { redirect } from "@sveltejs/kit";
import type { LayoutLoad } from "./$types";

// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

export const load: LayoutLoad = () => {
  const activeWorkout = globalState.activity.currentId;
  if (activeWorkout) {
    return redirect(303, `/activity/${activeWorkout}`);
  }
};
