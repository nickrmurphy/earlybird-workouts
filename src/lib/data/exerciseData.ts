import {
  discreteEquipment,
  discreteMuscle,
  exerciseSchema,
  type DiscreteEquipment,
  type DiscreteMuscle,
  type Exercise,
} from "$lib/db";
import { z } from "zod";

type ExerciseData = {
  allEquipment: DiscreteEquipment[];
  allMuscles: DiscreteMuscle[];
  allExercises: Exercise[];
};

async function fetchParsed<T>(url: string, schema: z.ZodType<T>): Promise<T> {
  const json = await fetch(url).then((response) => response.json());
  const parsed = schema.safeParse(json);

  if (!parsed.success) {
    console.error(parsed.error);
    return [] as T;
  }

  return parsed.data;
}

let cache: Promise<ExerciseData> | undefined;

/** Loads and validates the static exercise data once per session. */
function loadExerciseData(): Promise<ExerciseData> {
  cache ??= Promise.all([
    fetchParsed("/equipment.json", z.array(discreteEquipment)),
    fetchParsed("/muscles.json", z.array(discreteMuscle)),
    fetchParsed("/exercises.json", z.array(exerciseSchema)),
  ]).then(([allEquipment, allMuscles, allExercises]) => ({
    allEquipment,
    allMuscles,
    allExercises,
  }));

  return cache;
}

export { loadExerciseData };
export type { ExerciseData };
