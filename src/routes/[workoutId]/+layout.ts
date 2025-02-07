import type { LayoutLoad } from "./$types";

export const prerender = false;

import {
  discreteEquipment,
  discreteMuscle,
  exerciseSchema,
  type DiscreteEquipment,
  type DiscreteMuscle,
  type Exercise,
} from "$lib/db";
import { z } from "zod";

export const load: LayoutLoad = async ({ fetch }) => {
  const exerciseJson = await fetch("/exercises.json").then((data) =>
    data.json(),
  );
  const equipmentJson = await fetch("/equipment.json").then((data) =>
    data.json(),
  );
  const muscleJson = await fetch("/muscles.json").then((data) => data.json());

  const parsedExercises = z.array(exerciseSchema).safeParse(exerciseJson);
  const parsedEquipment = z.array(discreteEquipment).safeParse(equipmentJson);
  const parsedMuscles = z.array(discreteMuscle).safeParse(muscleJson);

  let allEquipment: DiscreteEquipment[] = [];
  let allMuscles: DiscreteMuscle[] = [];
  let allExercises: Exercise[] = [];

  if (!parsedEquipment.success) {
    console.error(parsedEquipment.error);
  } else {
    allEquipment = parsedEquipment.data;
  }

  if (!parsedMuscles.success) {
    console.error(parsedMuscles.error);
  } else {
    allMuscles = parsedMuscles.data;
  }

  if (!parsedExercises.success) {
    console.error(parsedExercises.error);
  } else {
    allExercises = parsedExercises.data;
  }

  return {
    allEquipment,
    allMuscles,
    allExercises,
  };
};
