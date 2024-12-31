import type Database from "@tauri-apps/plugin-sql";
import { services } from "./services.svelte";

// TODO: Move to types.ts when stabilized
type WorkoutHistory = {
  id: number;
  workoutId: number;
};

export class WorkoutHistoryService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async createWorkoutHistoryAndSets(workoutId: number) {
    // TODO: Implement transaction
    // https://github.com/tauri-apps/plugins-workspace/issues/886
    const createHistoryResult = await this.db.execute(
      `
        INSERT INTO workout_history (workout_id, start_time) VALUES ($1, CURRENT_TIMESTAMP)
      `,
      [workoutId]
    );

    console.log(createHistoryResult); //TODO: Remove after testing

    if (createHistoryResult.lastInsertId) {
      const exercises = await services.workout.getExercises(workoutId);
      const dbStatements: string[] = [];
      const queryValues = [createHistoryResult.lastInsertId];

      // Build DB Command
      exercises.forEach((exercise) => {
        const insertStatement = [];

        for (let i = 0; i < exercise.sets; i++) {
          insertStatement.push(`
            INSERT INTO workout_history_sets (workout_history_id, exercise_id, reps, weight)
            VALUES($1, $${queryValues.length + 1}, $${
            queryValues.length + 2
          }, $${queryValues.length + 3});
          `);
        }

        console.log(exercise); //TODO: Remove after testing
        queryValues.push(exercise.id, exercise.reps, exercise.weight);
        dbStatements.push(insertStatement.join(" "));
      });

      const command = dbStatements.join("");
      console.log(command); //TODO: Remove after testing
      console.log(queryValues); //TODO: Remove after testing
      // Execute DB Command
      try {
        await this.db.execute(command, queryValues);
      } catch (e) {
        console.error(e);
        throw e;
      }
    }

    return true;
  }

  async getPendingWorkoutHistory(): Promise<WorkoutHistory | undefined> {
    const result: WorkoutHistory[] = await this.db.select(
      `
        SELECT wh.id as id, w.id as workoutId
        FROM workout_history wh
        INNER JOIN workouts w on w.id = wh.workout_id
        WHERE wh.end_time IS NULL
      `
    );
    return result[0];
  }
}
