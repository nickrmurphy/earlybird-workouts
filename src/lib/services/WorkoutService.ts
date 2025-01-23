import Database from "@tauri-apps/plugin-sql";
import type { Exercise, Workout } from "../types";

export class WorkoutService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async getWorkouts(): Promise<Workout[]> {
    return this.db.select(
      `
            SELECT w.id as id, w.name as name
            FROM workouts w
        `,
    );
  }

  async createWorkout(name: string) {
    const result = await this.db.execute(
      `
        INSERT INTO workouts (name) VALUES ($1)
      `,
      [name],
    );
    return result.lastInsertId;
  }

  async renameWorkout(workoutId: number, name: string) {
    const result = await this.db.execute(
      `
        UPDATE workouts SET name = $1 WHERE id = $2
      `,
      [name, workoutId],
    );
    return result.rowsAffected;
  }

  async getWorkout(workoutId: number): Promise<Workout> {
    const result: Workout[] = await this.db.select(
      `
        SELECT w.id as id, w.name as name
        FROM workouts w
        WHERE w.id = $1
      `,
      [workoutId],
    );
    return result[0];
  }

  async deleteWorkout(workoutId: number) {
    const result = await this.db.execute(
      `
        DELETE FROM workouts WHERE id = $1
      `,
      [workoutId],
    );
    return result.rowsAffected;
  }

  async getExercises(workoutId: number): Promise<Exercise[]> {
    return this.db.select(
      `
            SELECT e.id as id, e.name as name, we.sets as sets, we.reps as reps, we.weight as weight, we.position as position
            FROM workout_exercises we
            INNER JOIN exercises e on e.id = we.exercise_id
            WHERE we.workout_id = $1
            ORDER BY we.position ASC
        `,
      [workoutId],
    );
  }

  async getExercise(
    workoutId: number,
    exerciseId: number,
  ): Promise<Exercise & { description: string }> {
    const result: (Exercise & { description: string })[] = await this.db.select(
      `
          SELECT e.id as id, e.name as name, e.description as description, we.sets as sets, we.reps as reps, we.weight as weight, we.position as position
          FROM workout_exercises we
          INNER JOIN exercises e on e.id = we.exercise_id
          WHERE we.exercise_id = $1 AND we.workout_id = $2
      `,
      [exerciseId, workoutId],
    );

    return result[0];
  }

  async addExercise(workoutId: number, exerciseId: number) {
    console.log("workoutId", workoutId);
    console.log("exerciseId", exerciseId);
    const result = await this.db.execute(
      `
        INSERT INTO workout_exercises (workout_id, exercise_id, sets, reps, weight) VALUES ($1, $2, $3, $4, $5)
      `,
      [workoutId, exerciseId, 4, 10, 40],
    );
    return result.lastInsertId;
  }

  async removeExercise(workoutId: number, exerciseId: number) {
    const result = await this.db.execute(
      `
        DELETE FROM workout_exercises WHERE workout_id = $1 AND exercise_id = $2
      `,
      [workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExerciseWeight(
    workoutId: number,
    exerciseId: number,
    weight: number,
  ) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET weight = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [weight, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExerciseSets(workoutId: number, exerciseId: number, sets: number) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET sets = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [sets, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExerciseReps(workoutId: number, exerciseId: number, reps: number) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET reps = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [reps, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExercisePosition(
    workoutId: number,
    exerciseId: number,
    position: number,
  ) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET position = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [position, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }
}
