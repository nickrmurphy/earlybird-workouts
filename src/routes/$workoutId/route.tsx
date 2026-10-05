import { loadExerciseData } from "$lib/data/exerciseData";
import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/$workoutId")({
  loader: () => loadExerciseData(),
});
