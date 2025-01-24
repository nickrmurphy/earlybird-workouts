import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ url }) => {
  const allEquipment = await services.equipment.getEquipment();
  const allMuscleGroups = await services.muscleGroup.getMuscleGroups();

  return { allEquipment, allMuscleGroups };
};
