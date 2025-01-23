import { services } from "$lib/stores";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ url }) => {
  const allEquipment = await services.equipment.getEquipment();
  const allMuscleGroups = await services.muscleGroup.getMuscleGroups();

  const equipmentId = url.searchParams.get("equipmentId");
  const muscleId = url.searchParams.get("muscleId");
  const queriedExercises = await services.exercise.queryExercises({
    name: url.searchParams.get("name") || undefined,
    equipmentId: equipmentId ? parseInt(equipmentId) : undefined,
    muscleId: muscleId ? parseInt(muscleId) : undefined,
  });

  return { queriedExercises, allEquipment, allMuscleGroups };
};
