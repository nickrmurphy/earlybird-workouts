import type Database from "@tauri-apps/plugin-sql";
import { WorkoutService } from "./WorkoutService";

// TODO: Move to types.ts when stabilized
type WorkoutHistory = {
  id: string;
  workoutId: string;
  workoutName: string;
  startTime: string;
};

// TODO: Move to types.ts when stabilized
type WorkoutHistoryExercise = {
  id: string;
  name: string;
  completeSets: number;
  sets: number;
  isComplete: number;
};

type WorkoutHistorySet = {
  id: string;
  reps: number;
  weight: number;
  exerciseId: string;
  exerciseName: string;
  isComplete: number;
};

export class WorkoutHistoryService {
  db: Database;
  workoutService: WorkoutService;

  constructor(db: Database) {
    this.db = db;
    this.workoutService = new WorkoutService(db);
  }

  async createWorkoutHistoryAndSets(workoutId: string) {
    const newHistoryId = crypto.randomUUID();
    // TODO: Implement transaction
    // https://github.com/tauri-apps/plugins-workspace/issues/886
    const createHistoryResult = await this.db.execute(
      `
        INSERT INTO workout_history (id, workout_id) VALUES ($1, $2);
      `,
      [newHistoryId, workoutId],
    );

    if (!createHistoryResult.lastInsertId) {
      throw new Error("Failed to create workout history");
    }

    const exercises = await this.workoutService.getExercises(workoutId);

    // Build DB Command
    exercises.forEach(async (exercise) => {
      for (let i = 0; i < exercise.sets; i++) {
        try {
          await this.db.execute(
            `
            INSERT INTO workout_history_sets (id, workout_history_id, exercise_id, reps, weight)
            VALUES ($1, $2, $3, $4, $5);
          `,
            [
              crypto.randomUUID(),
              newHistoryId,
              exercise.id,
              exercise.reps,
              exercise.weight,
            ],
          );
        } catch (e) {
          console.error(e);
          throw e;
        }
      }
    });

    return true;
  }

  async getActive(): Promise<WorkoutHistory | undefined> {
    const result: WorkoutHistory[] = await this.db.select(
      `
        SELECT wh.id as id, w.id as workoutId, w.name as workoutName, wh.start_time as startTime
        FROM workout_history wh
        INNER JOIN workouts w on w.id = wh.workout_id
        WHERE wh.end_time IS NULL
      `,
    );
    return result[0];
  }

  async getWorkoutHistoryExercises(
    workoutHistoryId: string,
  ): Promise<WorkoutHistoryExercise[]> {
    const result: WorkoutHistoryExercise[] = await this.db.select(
      `
        SELECT 
          e.id AS id, 
          e.name AS name,
          COUNT(*) AS sets, 
          (
            SELECT COUNT(*)
            FROM workout_history_sets whs
            INNER JOIN workout_history wh ON wh.id = whs.workout_history_id
            WHERE whs.is_complete = 1 AND whs.exercise_id = e.id AND wh.id = $1
          ) AS completeSets,
          NOT EXISTS (
              SELECT 1 
              FROM workout_history_sets whs 
              INNER JOIN workout_history wh ON wh.id = whs.workout_history_id
              WHERE whs.is_complete = 0 AND whs.exercise_id = e.id AND wh.id = $1
          ) AS isComplete,
        we.position AS position
      FROM workout_history wh
      INNER JOIN workout_history_sets whs ON whs.workout_history_id = wh.id
      INNER JOIN exercises e ON e.id = whs.exercise_id
      INNER JOIN workout_exercises we ON we.exercise_id = whs.exercise_id
      WHERE wh.id = $1
      GROUP BY e.id, e.name
      ORDER BY we.position ASC;
    `,
      [workoutHistoryId],
    );
    return result;
  }

  async setWorkoutHistoryEndTime(workoutHistoryId: string) {
    await this.db.execute(
      `
        UPDATE workout_history
        SET end_time = datetime('now')
        WHERE id = $1
      `,
      [workoutHistoryId],
    );
  }

  async getExerciseWorkoutHistorySets(
    workoutHistoryId: string,
    exerciseId: string,
  ): Promise<WorkoutHistorySet[]> {
    const result: WorkoutHistorySet[] = await this.db.select(
      `
      SELECT whs.id as id, whs.reps as reps, whs.weight as weight, whs.is_complete as isComplete, whs.exercise_id as exerciseId, e.name as exerciseName
      FROM workout_history_sets whs
      INNER JOIN exercises e ON whs.exercise_id = $2
      WHERE whs.workout_history_id = $1 AND whs.exercise_id = $2 AND e.id = $2;
    `,
      [workoutHistoryId, exerciseId],
    );

    return result;
  }

  async setWorkoutHistorySetReps(workoutHistorySetId: string, reps: number) {
    await this.db.execute(
      `
      UPDATE workout_history_sets
      SET reps = $1
      WHERE id = $2
    `,
      [reps, workoutHistorySetId],
    );
  }

  async setWorkoutHistorySetWeight(
    workoutHistorySetId: string,
    weight: number,
  ) {
    await this.db.execute(
      `
      UPDATE workout_history_sets
      SET weight = $1
      WHERE id = $2
    `,
      [weight, workoutHistorySetId],
    );
  }

  async setWorkoutHistorySetComplete(
    workoutHistorySetId: string,
    isComplete: boolean,
  ) {
    await this.db.execute(
      `
      UPDATE workout_history_sets
      SET is_complete = $1
      WHERE id = $2
    `,
      [isComplete ? 1 : 0, workoutHistorySetId],
    );
  }

  async getWorkoutHistories(workoutId: string): Promise<WorkoutHistory[]> {
    const result: WorkoutHistory[] = await this.db.select(
      `
        SELECT wh.id as id, w.id as workoutId, w.name as workoutName, wh.start_time as startTime
        FROM workout_history wh
        INNER JOIN workouts w on w.id = wh.workout_id
        WHERE w.id = $1
        ORDER BY wh.start_time DESC
      `,
      [workoutId],
    );
    return result;
  }

  async getWorkoutHistorySets(
    workoutHistoryId: string,
  ): Promise<WorkoutHistorySet[]> {
    const result: WorkoutHistorySet[] = await this.db.select(
      `
      SELECT whs.id as id, whs.reps as reps, whs.weight as weight, whs.is_complete as isComplete, whs.exercise_id as exerciseId, e.name as exerciseName
      FROM workout_history_sets whs
      INNER JOIN workout_history wh ON wh.id = whs.workout_history_id
      INNER JOIN exercises e ON e.id = whs.exercise_id
      WHERE wh.id = $1
    `,
      [workoutHistoryId],
    );

    return result;
  }
}
