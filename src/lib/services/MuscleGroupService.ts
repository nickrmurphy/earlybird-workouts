import Database from "@tauri-apps/plugin-sql";
import type { MuscleGroup } from "../types";

export class MuscleGroupService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  getMuscleGroups(): Promise<MuscleGroup[]> {
    return this.db.select(
      `
        SELECT mg.id as id, mg.name as name
        FROM muscle_groups mg
        ORDER BY mg.name
        `
    );
  }
}
