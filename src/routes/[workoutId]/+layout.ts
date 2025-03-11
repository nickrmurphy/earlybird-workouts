import { getEquipment, getExercises, getMuscles } from "$lib/resources";
import type { LayoutLoad } from "./$types";

export const prerender = false;

export const load: LayoutLoad = async () => {
  const [allEquipment, allMuscles, allExercises] = await Promise.all([
    getEquipment(),
    getMuscles(),
    getExercises(),
  ]);

  return {
    allEquipment,
    allMuscles,
    // TODO: Add instructions to exercises
    allExercises: allExercises.map((exercise) => ({
      ...exercise,
      instructions: [],
    })),
  };
};
