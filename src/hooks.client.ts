import type { ClientInit } from "@sveltejs/kit";
import Database from "@tauri-apps/plugin-sql";
import { db } from "$lib/db.svelte";

export const init: ClientInit = async () => {
  const dbConnection = await Database.load("sqlite:earlybirdworkouts.db");
  db.earlybird = dbConnection;
};
