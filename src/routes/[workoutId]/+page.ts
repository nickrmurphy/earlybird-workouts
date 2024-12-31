import { db } from "$lib/db.svelte";
import type { Exercise } from "../../types";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ params }) => {
  const workoutResult: { id: number; name: string }[] =
    await db.earlybird.select(
      `
        SELECT w.id as id, w.name as name
        FROM workouts w
        WHERE w.id = $1
    `,
      [params.workoutId]
    );

  const exercises: Exercise[] = await db.earlybird.select(
    `
        SELECT e.id as id, e.name as name, we.sets as sets, we.reps as reps, we.weight as weight
        FROM workout_exercises we
        INNER JOIN exercises e on e.id = we.exercise_id
        WHERE we.workout_id = $1
    `,
    [params.workoutId]
  );

  return { exercises, workout: workoutResult[0] };
};
