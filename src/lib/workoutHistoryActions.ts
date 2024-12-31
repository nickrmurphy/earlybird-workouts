import { goto } from "$app/navigation";
import { services } from "./services.svelte";
import { mutation } from "./utils";

export const completeWorkout = async (workoutHistoryId: number) => {
  await mutation(
    services.workoutHistory.setWorkoutHistoryEndTime(workoutHistoryId)
  );
  goto("/");
};
