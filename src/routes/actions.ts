import { invalidateAll } from "$app/navigation";
import Database from "@tauri-apps/plugin-sql";

export const createWorkout = async (name: string) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute("INSERT INTO workouts (name) VALUES ($1)", [
    name,
  ]);
  invalidateAll();
  return result.lastInsertId;
};
