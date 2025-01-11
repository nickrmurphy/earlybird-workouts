import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ url }) => {
  const allEquipment = await services.equipment.getEquipment();
  const allMuscleGroups = await services.muscleGroup.getMuscleGroups();

  const equipmentId = url.searchParams.get("equipmentId");
  const muscleGroupId = url.searchParams.get("muscleGroupId");
  const queriedExercises = await services.exercise.queryExercises({
    name: url.searchParams.get("name") || undefined,
    equipmentId: equipmentId ? parseInt(equipmentId) : undefined,
    muscleGroupId: muscleGroupId ? parseInt(muscleGroupId) : undefined,
  });

  return { queriedExercises, allEquipment, allMuscleGroups };
};
