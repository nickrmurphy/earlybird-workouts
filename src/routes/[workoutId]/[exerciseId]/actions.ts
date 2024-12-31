import { invalidateAll } from "$app/navigation";
import Database from "@tauri-apps/plugin-sql";

export const updateWeight = async (
  workoutId: number,
  exerciseId: number,
  weight: number
) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "UPDATE workout_exercises SET weight = $1 WHERE workout_id = $2 AND exercise_id = $3",
    [weight, workoutId, exerciseId]
  );
  invalidateAll();
  return result.rowsAffected;
};

export const updateSets = async (
  workoutId: number,
  exerciseId: number,
  sets: number
) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "UPDATE workout_exercises SET sets = $1 WHERE workout_id = $2 AND exercise_id = $3",
    [sets, workoutId, exerciseId]
  );
  invalidateAll();
  return result.rowsAffected;
};

export const updateReps = async (
  workoutId: number,
  exerciseId: number,
  reps: number
) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "UPDATE workout_exercises SET reps = $1 WHERE workout_id = $2 AND exercise_id = $3",
    [reps, workoutId, exerciseId]
  );
  invalidateAll();
  return result.rowsAffected;
};

export const deleteExercise = async (workoutId: number, exerciseId: number) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const result = await db.execute(
    "DELETE FROM workout_exercises WHERE workout_id = $1 AND exercise_id = $2",
    [workoutId, exerciseId]
  );
  await invalidateAll();
  return result.rowsAffected;
};
