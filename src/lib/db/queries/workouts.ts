import { db } from "../db";

type WorkoutInfo = {
  id: string;
  name: string;
  exercises: string[];
};

async function getWorkoutsInfo(): Promise<WorkoutInfo[]> {
  const workoutsPromise = db.workouts.toArray();
  const workoutExercisesPromise = db.workoutExercises.toArray();
  let workoutInfo: WorkoutInfo[] = [];

  await Promise.all([workoutsPromise, workoutExercisesPromise]).then(
    ([workouts, workoutExercises]) => {
      workoutInfo = workouts.map((workout) => {
        return {
          id: workout.id,
          name: workout.name,
          exercises: workoutExercises
            .filter((exercise) => exercise.workoutId === workout.id)
            .map((e) => e.name),
        };
      });
    },
  );

  return workoutInfo;
}

export { getWorkoutsInfo };
