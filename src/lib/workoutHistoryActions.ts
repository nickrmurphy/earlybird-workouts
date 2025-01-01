import { goto } from "$app/navigation";
import { services } from "./services.svelte";
import { mutation } from "./utils";

export const completeWorkout = async (workoutHistoryId: number) => {
  await mutation(
    services.workoutHistory.setWorkoutHistoryEndTime(workoutHistoryId)
  );
  goto("/");
};

export const completeWorkoutSet = async (
  workoutHistorySetId: number,
  isComplete: boolean
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetComplete(
      workoutHistorySetId,
      isComplete
    )
  );

export const setWorkoutHistorySetReps = async (
  workoutHistorySetId: number,
  reps: number
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetReps(workoutHistorySetId, reps)
  );

export const setWorkoutHistorySetWeight = async (
  workoutHistorySetId: number,
  weight: number
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetWeight(
      workoutHistorySetId,
      weight
    )
  );
