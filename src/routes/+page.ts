import type { PageLoad } from "./$types";
import Database from "@tauri-apps/plugin-sql";

export const load: PageLoad = async () => {
  try {
    const db = await Database.load("sqlite:earlybirdworkouts.db");
  } catch (e) {
    return { error: JSON.stringify(e) };
  }
};
