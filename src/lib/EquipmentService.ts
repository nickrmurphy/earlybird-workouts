import Database from "@tauri-apps/plugin-sql";
import type { Equipment } from "../types";

export class EquipmentService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  getEquipment(): Promise<Equipment[]> {
    return this.db.select(
      `
            SELECT e.id as id, e.name as name
            FROM equipment e
            ORDER BY e.name
        `
    );
  }
}
