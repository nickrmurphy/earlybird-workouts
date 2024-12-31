// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)
// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

import { services } from "$lib/services.svelte";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async () => {
  const allExercises = await services.exercise.getExercises();
  return { allExercises };
};
