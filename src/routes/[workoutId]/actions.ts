import { invalidateAll } from "$app/navigation";
import { db } from "$lib/db.svelte";

export const addExercise = async (workoutId: number, exerciseId: number) => {
  const result = await db.earlybird.execute(
    "INSERT INTO workout_exercises (workout_id, exercise_id, sets, reps, weight) VALUES ($1, $2, $3, $4, $5)",
    [workoutId, exerciseId, 4, 10, 40]
  );
  invalidateAll();
  return result.lastInsertId;
};

export const removeExercise = async (workoutId: number, exerciseId: number) => {
  const result = await db.earlybird.execute(
    "DELETE FROM workout_exercises WHERE workout_id = $1 AND exercise_id = $2",
    [workoutId, exerciseId]
  );
  invalidateAll();
  return result.rowsAffected;
};

export const deleteWorkout = async (workoutId: number) => {
  const result = await db.earlybird.execute(
    "DELETE FROM workouts WHERE id = $1",
    [workoutId]
  );
  await invalidateAll();
  return result.rowsAffected;
};
