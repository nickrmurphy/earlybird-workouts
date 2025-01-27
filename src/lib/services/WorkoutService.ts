import Database from "@tauri-apps/plugin-sql";
import type { Exercise, PopulatedWorkout, Workout } from "../types";

export class WorkoutService {
  db: Database;

  constructor(db: Database) {
    this.db = db;
  }

  async all(): Promise<PopulatedWorkout[]> {
    const rows: {
      id: string;
      name: string;
      exerciseId: string;
      exerciseName: string;
    }[] = await this.db.select(
      `
      SELECT w.id as id, w.name as name, e.id as exerciseId, e.name as exerciseName
      FROM workouts w
      INNER JOIN workout_exercises we on w.id = we.workout_id
      INNER JOIN exercises e on we.exercise_id = e.id
      `,
    );

    const workouts: PopulatedWorkout[] = [];

    for (const row of rows) {
      const workout = workouts.find((w) => w.id === row.id);
      if (workout) {
        workout.exercises.push({ id: row.exerciseId, name: row.exerciseName });
      } else {
        workouts.push({
          id: row.id,
          name: row.name,
          exercises: [{ id: row.exerciseId, name: row.exerciseName }],
        });
      }
    }

    return workouts;
  }

  async createWorkout(name: string): Promise<string> {
    const newId = crypto.randomUUID();
    await this.db.execute(
      `
        INSERT INTO workouts (id, name) VALUES ($1, $2)
        RETURNING *
      `,
      [newId, name],
    );
    return newId;
  }

  async renameWorkout(workoutId: string, name: string) {
    const result = await this.db.execute(
      `
        UPDATE workouts SET name = $1 WHERE id = $2
      `,
      [name, workoutId],
    );
    return result.rowsAffected;
  }

  async getWorkout(workoutId: string): Promise<Workout> {
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

  async deleteWorkout(workoutId: string) {
    const result = await this.db.execute(
      `
        DELETE FROM workouts WHERE id = $1;
      `,
      [workoutId],
    );
    return result.rowsAffected;
  }

  async getExercises(workoutId: string): Promise<Exercise[]> {
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

  async getExercise(workoutId: string, exerciseId: string): Promise<Exercise> {
    const result: Exercise[] = await this.db.select(
      `
          SELECT e.id as id, e.name as name, we.sets as sets, we.reps as reps, we.weight as weight, we.position as position
          FROM workout_exercises we
          INNER JOIN exercises e on e.id = we.exercise_id
          WHERE we.exercise_id = $1 AND we.workout_id = $2
      `,
      [exerciseId, workoutId],
    );

    return result[0];
  }

  async addExercise(workoutId: string, exerciseId: string) {
    const newId: string = crypto.randomUUID();
    await this.db.execute(
      `
        INSERT INTO workout_exercises (id, workout_id, exercise_id, sets, reps, weight) VALUES ($1, $2, $3, $4, $5, $6)
      `,
      [newId, workoutId, exerciseId, 4, 10, 40],
    );
    return newId;
  }

  async removeExercise(workoutId: string, exerciseId: string) {
    const result = await this.db.execute(
      `
        DELETE FROM workout_exercises WHERE workout_id = $1 AND exercise_id = $2
      `,
      [workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExerciseWeight(
    workoutId: string,
    exerciseId: string,
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

  async setExerciseSets(workoutId: string, exerciseId: string, sets: number) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET sets = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [sets, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExerciseReps(workoutId: string, exerciseId: string, reps: number) {
    const result = await this.db.execute(
      `
        UPDATE workout_exercises SET reps = $1 WHERE workout_id = $2 AND exercise_id = $3
      `,
      [reps, workoutId, exerciseId],
    );
    return result.rowsAffected;
  }

  async setExercisePosition(
    workoutId: string,
    exerciseId: string,
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
