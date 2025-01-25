import { services } from "../stores";
import { mutation } from "../utils";

export const completeWorkout = async (workoutHistoryId: string) =>
  mutation(services.workoutHistory.setWorkoutHistoryEndTime(workoutHistoryId));

export const completeWorkoutSet = async (
  workoutHistorySetId: string,
  isComplete: boolean,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetComplete(
      workoutHistorySetId,
      isComplete,
    ),
  );

export const setWorkoutHistorySetReps = async (
  workoutHistorySetId: string,
  reps: number,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetReps(workoutHistorySetId, reps),
  );

export const setWorkoutHistorySetWeight = async (
  workoutHistorySetId: string,
  weight: number,
) =>
  mutation(
    services.workoutHistory.setWorkoutHistorySetWeight(
      workoutHistorySetId,
      weight,
    ),
  );
