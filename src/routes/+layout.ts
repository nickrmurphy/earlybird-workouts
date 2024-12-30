// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)
// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

import type { LayoutLoad } from "./$types";
import Database from "@tauri-apps/plugin-sql";

export const load: LayoutLoad = async () => {
  try {
    const db = await Database.load("sqlite:earlybirdworkouts.db");

    const allExercises: { id: number; name: string }[] = await db.select(`
        SELECT e.id as id, e.name as name
        FROM exercises e
    `);

    return { allExercises };
  } catch (e) {
    console.error(e);
  }
};
