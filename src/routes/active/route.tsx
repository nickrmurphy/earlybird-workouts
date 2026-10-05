import { loadExerciseData } from "$lib/data/exerciseData";
import { activity } from "$lib/state";
import { createFileRoute, redirect } from "@tanstack/react-router";

export const Route = createFileRoute("/active")({
  beforeLoad: () => {
    if (!activity.currentId) {
      throw redirect({ to: "/" });
    }
  },
  loader: () => loadExerciseData(),
});
