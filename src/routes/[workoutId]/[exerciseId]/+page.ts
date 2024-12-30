import Database from "@tauri-apps/plugin-sql";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params }) => {
  const db = await Database.load("sqlite:earlybirdworkouts.db");
  const exerciseResult: {
    id: number;
    name: string;
    sets: number;
    reps: number;
    weight: number;
  }[] = await db.select(
    `
      SELECT e.id as id, e.name as name, we.sets as sets, we.reps as reps, we.weight as weight
      FROM workout_exercises we
      INNER JOIN exercises e on e.id = we.exercise_id
      WHERE we.exercise_id = $1 AND we.workout_id = $2
  `,
    [params.exerciseId, params.workoutId]
  );

  return {
    exercise: exerciseResult[0],
    workoutId: Number(params.workoutId),
  };
};
