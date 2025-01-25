import Database from "@tauri-apps/plugin-sql";
type FilterOptions = {
  name?: string;
  muscleIds?: string[];
  equipmentIds?: string[];
};

export class ExerciseService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async queryExercises(
    options: FilterOptions,
  ): Promise<{ id: string; name: string; description: string }[]> {
    const filterClauses: string[] = [];
    let params: (number | string)[] = [];

    if (options.name) {
      filterClauses.push(`e.name LIKE $${params.length + 1}`);
      params.push(`%${options.name}%`);
    }

    if (options.muscleIds && options.muscleIds.length > 0) {
      filterClauses.push(
        `e.primary_muscle_id IN (${options.muscleIds.map((_, idx) => `$${params.length + 1 + idx}`)})`,
      );
      params.push(...options.muscleIds);
    }

    if (options.equipmentIds && options.equipmentIds.length > 0) {
      console.log(options.equipmentIds);
      const equipmentIds = options.equipmentIds.filter((e) => e != "NULL");
      let filterEquipmentClauses: string[] = [];

      if (equipmentIds.length !== options.equipmentIds.length) {
        filterEquipmentClauses.push(`e.equipment_id IS NULL`);
      }

      if (equipmentIds.length > 0) {
        filterEquipmentClauses.push(
          `e.equipment_id IN (${equipmentIds.map((_, idx) => `$${params.length + 1 + idx}`)})`,
        );
      }
      filterClauses.push(`(${filterEquipmentClauses.join(" OR ")})`);

      params.push(...options.equipmentIds);
    }

    const query = `
      SELECT e.id as id, e.name as name, 'empty' as description
      FROM exercises e
      ${filterClauses.length > 0 ? `WHERE ${filterClauses.join(" AND ")}` : ""}
      ORDER BY e.name
    `;

    console.log(query, params);

    const exercises: { id: string; name: string; description: string }[] =
      await this.db.select(query, params);
    return exercises;
  }

  async getExercises(): Promise<{ id: string; name: string }[]> {
    const allExercises: { id: string; name: string }[] = await this.db.select(`
            SELECT e.id as id, e.name as name
            FROM exercises e
            ORDER BY e.name
        `);
    return allExercises;
  }

  async getExercise(exerciseId: string): Promise<{ id: string; name: string }> {
    const exerciseResult: { id: string; name: string }[] = await this.db.select(
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
