import { db } from "../db";

async function createWorkoutHistoryAndExerciseSets(
  workoutId: string,
): Promise<string> {
  return db.transaction(
    "rw",
    [
      db.workoutExercises,
      db.workouts,
      db.history,
      db.historyExercises,
      db.historySets,
    ],
    async (tx) => {
      const workout = await tx.workouts.get(workoutId);

      if (!workout) throw new Error("Workout not found");

      const exercises = await tx.workoutExercises
        .where("workoutId")
        .equals(workout.id)
        .sortBy("order");

      const historyId = await tx.history.add({
        workoutId: workout.id,
        startTime: new Date(),
        workoutName: workout.name,
      });

      for (const exercise of exercises) {
        const historyExerciseId = await tx.historyExercises.add({
          historyId,
          exerciseId: exercise.exerciseId,
          exerciseName: exercise.name,
        });

        await tx.historySets.bulkAdd(
          Array.from({ length: exercise.sets }, () => ({
            historyId,
            historyExerciseId,
            weight: exercise.weight,
            count: exercise.count,
            exerciseId: exercise.exerciseId,
            isSuccess: false,
            countUnit: exercise.countUnit,
            weightUnit: exercise.weightUnit,
          })),
        );
      }

      return historyId;
    },
  );
}

export { createWorkoutHistoryAndExerciseSets };
