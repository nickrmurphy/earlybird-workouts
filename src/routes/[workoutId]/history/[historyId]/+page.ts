import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

type ExerciseHistory = {
  exerciseId: string;
  exerciseName: string;
  sets: {
    reps: number;
    weight: number;
    isComplete: number;
  }[];
};

export const load: PageLoad = async ({ params }) => {
  const exerciseHistoryMap: Record<string, ExerciseHistory> = {};
  const workoutHistorySets =
    await services.workoutHistory.getWorkoutHistorySets(params.historyId);

  workoutHistorySets.forEach((set) => {
    if (!exerciseHistoryMap[set.exerciseId]) {
      exerciseHistoryMap[set.exerciseId] = {
        exerciseId: set.exerciseId,
        exerciseName: set.exerciseName,
        sets: [set],
      };
    } else {
      exerciseHistoryMap[set.exerciseId].sets.push({
        reps: set.reps,
        weight: set.weight,
        isComplete: set.isComplete,
      });
    }
  });

  const exerciseHistory = Object.values(exerciseHistoryMap);

  return {
    exerciseHistory,
    historyId: params.historyId,
  };
};
