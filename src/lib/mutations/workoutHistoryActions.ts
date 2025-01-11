import { services } from "./stores";
import { mutation } from "./utils";

export const completeWorkout = async (workoutHistoryId: number) =>
  mutation(services.workoutHistory.setWorkoutHistoryEndTime(workoutHistoryId));

export const completeWorkoutSet = async (
  workoutHistorySetId: number,
  isComplete: boolean,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetComplete(
      workoutHistorySetId,
      isComplete,
    ),
  );

export const setWorkoutHistorySetReps = async (
  workoutHistorySetId: number,
  reps: number,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetReps(workoutHistorySetId, reps),
  );

export const setWorkoutHistorySetWeight = async (
  workoutHistorySetId: number,
  weight: number,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetWeight(
      workoutHistorySetId,
      weight,
    ),
  );
