import Database from "@tauri-apps/plugin-sql";

export class ExerciseService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async getExercises(): Promise<{ id: number; name: string }[]> {
    const allExercises: { id: number; name: string }[] = await this.db.select(`
            SELECT e.id as id, e.name as name
            FROM exercises e
        `);
    return allExercises;
  }

  async getExercise(exerciseId: number): Promise<{ id: number; name: string }> {
    const exerciseResult: { id: number; name: string }[] = await this.db.select(
      `
            SELECT e.id as id, e.name as name
            FROM exercises e
            WHERE e.id = $1
        `,
      [exerciseId]
    );
    return exerciseResult[0];
  }
}
