import Database from "@tauri-apps/plugin-sql";
import type { Muscle } from "../types";

export class MuscleGroupService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  getMuscleGroups(): Promise<Muscle[]> {
    return this.db.select(
      `
        SELECT m.id as id, m.name as name
        FROM muscles m
        ORDER BY m.name
        `,
    );
  }
}
