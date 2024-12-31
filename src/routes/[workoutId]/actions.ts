import { invalidateAll } from "$app/navigation";
import Database from "@tauri-apps/plugin-sql";

export const addExercise = async (workoutId: number, exerciseId: number) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "INSERT INTO workout_exercises (workout_id, exercise_id, sets, reps, weight) VALUES ($1, $2, $3, $4, $5)",
    [workoutId, exerciseId, 4, 10, 40]
  );
  invalidateAll();
  return result.lastInsertId;
};

export const removeExercise = async (workoutId: number, exerciseId: number) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "DELETE FROM workout_exercises WHERE workout_id = $1 AND exercise_id = $2",
    [workoutId, exerciseId]
  );
  invalidateAll();
  return result.rowsAffected;
};

export const deleteWorkout = async (workoutId: number) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute("DELETE FROM workouts WHERE id = $1", [
    workoutId,
  ]);
  await invalidateAll();
  return result.rowsAffected;
};
