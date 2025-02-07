import { exerciseSchema } from "$lib/db";
import { z } from "zod";
import type { LayoutLoad } from "../$types";

export const load: LayoutLoad = async () => {
  const exerciseJson = await fetch("/exercises.json").then((data) =>
    data.json(),
  );
  const allExercises = z.array(exerciseSchema).safeParse(exerciseJson);

  return { allExercises: allExercises.success ? allExercises.data : [] };
};
