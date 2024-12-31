// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)
// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

import { db } from "$lib/db.svelte";
import type { LayoutLoad } from "./$types";

export const load: LayoutLoad = async () => {
  try {
    const allExercises: { id: number; name: string }[] = await db.earlybird
      .select(`
        SELECT e.id as id, e.name as name
        FROM exercises e
    `);
    console.log("allExercises", allExercises);
    return { allExercises };
  } catch (e) {
    console.error(e);
  }
};
