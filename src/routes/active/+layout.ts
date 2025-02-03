import type { LayoutLoad } from "../$types";
import { exerciseSchema } from "$lib/schema";
import { z } from "zod";

export const load: LayoutLoad = async () => {
  const exerciseJson = await fetch("/exercises.json").then((data) =>
    data.json(),
  );
  const allExercises = z.array(exerciseSchema).safeParse(exerciseJson);

  return { allExercises: allExercises.success ? allExercises.data : [] };
};
