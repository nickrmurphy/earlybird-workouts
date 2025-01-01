import type Database from "@tauri-apps/plugin-sql";
import { services } from "./services.svelte";

// TODO: Move to types.ts when stabilized
type WorkoutHistory = {
  id: number;
  workoutId: number;
  workoutName: string;
};

// TODO: Move to types.ts when stabilized
type WorkoutHistoryExercise = {
  id: number;
  name: string;
  sets: number;
  isComplete: number;
};

type WorkoutHistorySet = {
  id: number;
  reps: number;
  weight: number;
  isComplete: number;
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

        queryValues.push(exercise.id, exercise.reps, exercise.weight);
        dbStatements.push(insertStatement.join(" "));
      });

      const command = dbStatements.join("");

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
        SELECT wh.id as id, w.id as workoutId, w.name as workoutName
        FROM workout_history wh
        INNER JOIN workouts w on w.id = wh.workout_id
        WHERE wh.end_time IS NULL
      `
    );
    return result[0];
  }

  async getWorkoutHistoryExercises(
    workoutHistoryId: number
  ): Promise<WorkoutHistoryExercise[]> {
    const result: WorkoutHistoryExercise[] = await this.db.select(
      `
            SELECT 
          e.id AS id, 
          e.name AS name, 
          COUNT(*) AS sets, 
          NOT EXISTS (
              SELECT 1 
              FROM workout_history_sets whs 
              WHERE whs.is_complete = 0 AND whs.exercise_id = e.id
          ) AS isComplete
      FROM workout_history wh
      INNER JOIN workout_history_sets whs ON whs.workout_history_id = wh.id
      INNER JOIN exercises e ON e.id = whs.exercise_id
      WHERE wh.id = $1
      GROUP BY e.id, e.name;
    `,
      [workoutHistoryId]
    );
    return result;
  }

  async setWorkoutHistoryEndTime(workoutHistoryId: number) {
    await this.db.execute(
      `
        UPDATE workout_history
        SET end_time = CURRENT_TIMESTAMP
        WHERE id = $1
      `,
      [workoutHistoryId]
    );
  }

  async getWorkoutHistorySets(
    workoutHistoryId: number,
    exerciseId: number
  ): Promise<WorkoutHistorySet[]> {
    const result: WorkoutHistorySet[] = await this.db.select(
      `
      SELECT whs.id as id, whs.reps as reps, whs.weight as weight, whs.is_complete as isComplete
      FROM workout_history_sets whs
      WHERE whs.workout_history_id = $1 AND whs.exercise_id = $2;
    `,
      [workoutHistoryId, exerciseId]
    );

    return result;
  }
}
