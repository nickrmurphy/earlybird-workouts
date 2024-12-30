import type { PageLoad } from "./$types";
import Database from "@tauri-apps/plugin-sql";

export const load: PageLoad = async () => {
  try {
    const db = await Database.load("sqlite:earlybirdworkouts.db");
    const workouts: { id: number; name: string; count: number }[] =
      await db.select(`
        SELECT w.id as id, w.name as name, count(we.id) as count
        FROM workouts w
        LEFT JOIN workout_exercises we on we.workout_id = w.id
        GROUP BY w.id
    `);

    const workoutExercises: { workoutId: number; name: string }[] =
      await db.select(`
        SELECT we.workout_id as workoutId, e.name as name
        FROM workout_exercises we
        INNER JOIN exercises e on e.id = we.exercise_id
    `);

    const exercises = Object.groupBy(
      workoutExercises,
      ({ workoutId }) => workoutId
    );

    return { workouts, exercises };
  } catch (e) {
    return { error: JSON.stringify(e) };
  }
};
