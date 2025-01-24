import Database from "@tauri-apps/plugin-sql";
type FilterOptions = {
  name?: string;
  muscleIds?: number[];
  equipmentIds?: number[];
};

const hasFilter = (options: FilterOptions): boolean =>
  (options.name || options.equipmentIds || options.muscleIds) !== undefined;

export class ExerciseService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async queryExercises(
    options: FilterOptions,
  ): Promise<{ id: number; name: string; description: string }[]> {
    const filterClauses: string[] = [];
    let params: (number | string)[] = [];

    if (options.name) {
      filterClauses.push(`e.name LIKE $${params.length + 1}`);
      params.push(`%${options.name}%`);
    }

    if (options.muscleIds && options.muscleIds.length > 0) {
      filterClauses.push(
        `e.muscle_id IN (${options.muscleIds.map((_, idx) => `$${params.length + 1 + idx}`)})`,
      );
      params.push(...options.muscleIds);
    }

    if (options.equipmentIds && options.equipmentIds.length > 0) {
      filterClauses.push(
        `e.equipment_id IN (${options.equipmentIds.map((_, idx) => `$${params.length + 1 + idx}`)})`,
      );
      params.push(...options.equipmentIds);
    }

    const query = `
      SELECT e.id as id, e.name as name, e.description as description
      FROM exercises e
      ${filterClauses.length > 0 ? `WHERE ${filterClauses.join(" AND ")}` : ""}
      ORDER BY e.name
    `;

    console.log(query, params);

    const exercises: { id: number; name: string; description: string }[] =
      await this.db.select(query, params);
    return exercises;
  }

  async getExercises(): Promise<{ id: number; name: string }[]> {
    const allExercises: { id: number; name: string }[] = await this.db.select(`
            SELECT e.id as id, e.name as name
            FROM exercises e
            ORDER BY e.name
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
      [exerciseId],
    );
    return exerciseResult[0];
  }
}
