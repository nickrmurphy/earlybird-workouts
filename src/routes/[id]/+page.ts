import type { Exercise } from "../../types";
import type { PageLoad } from "./$types";
import Database from "@tauri-apps/plugin-sql";

export const load: PageLoad = async ({ params }) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");

  const workoutResult: { id: number; name: string }[] = await db.select(
    `
        SELECT w.id as id, w.name as name
        FROM workouts w
        WHERE w.id = $1
    `,
    [params.id]
  );

  const exercises: Exercise[] = await db.select(
    `
        SELECT e.id as id, e.name as name, we.sets as sets, we.reps as reps, we.weight as weight
        FROM workout_exercises we
        INNER JOIN exercises e on e.id = we.exercise_id
        WHERE we.workout_id = $1
    `,
    [params.id]
  );

  return { exercises, workout: workoutResult[0] };
};
