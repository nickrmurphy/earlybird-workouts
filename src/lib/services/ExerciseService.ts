import Database from "@tauri-apps/plugin-sql";
type FilterOptions = {
  name?: string;
  muscleGroupId?: number;
  equipmentId?: number;
};

const hasFilter = (options: FilterOptions): boolean =>
  (options.name || options.equipmentId || options.muscleGroupId) !== undefined;

export class ExerciseService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async queryExercises(
    options: FilterOptions,
  ): Promise<{ id: number; name: string }[]> {
    const filterClauses: string[] = [];
    let params: (number | string)[] = [];

    if (hasFilter(options)) {
      if (options.name) {
        filterClauses.push(`e.name LIKE $${params.length + 1}`);
        params.push(`%${options.name}%`);
      }

      if (options.muscleGroupId) {
        filterClauses.push(`e.muscle_group_id = $${params.length + 1}`);
        params.push(options.muscleGroupId);
      }

      if (options.equipmentId) {
        filterClauses.push(
          `(e.primary_equipment_id = $${
            params.length + 1
          } OR e.secondary_equipment_id = $${params.length + 1})`,
        );
        params.push(options.equipmentId);
      }
    }

    const query = `
      SELECT e.id as id, e.name as name
      FROM exercises e
      ${filterClauses.length > 0 ? `WHERE ${filterClauses.join(" AND ")}` : ""}
      ORDER BY e.name
    `;

    console.log("query", query);
    console.log("params", params);

    const exercises: { id: number; name: string }[] = await this.db.select(
      query,
      params,
    );
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
