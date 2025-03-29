import { db } from "$lib/database/db";

type ExerciseDetail = {
  id: string;
  exerciseName: string;
  instructions: string[];
  equipment: {
    id: string;
    name: string;
  };
  muscles: {
    id: string;
    name: string;
  }[];
};

async function getExercises(): Promise<ExerciseDetail[]> {
  const data = await db
    .selectFrom("exercise")
    .innerJoin("equipment", "equipment.id", "exercise.equipmentId")
    .innerJoin("exerciseMuscle", "exerciseMuscle.exerciseId", "exercise.id")
    .innerJoin("muscle", "muscle.id", "exerciseMuscle.muscleId")
    .where("exerciseMuscle.isPrimary", "=", 1)
    .select([
      "exercise.id",
      "exercise.name as exerciseName",
      "exercise.instructions as instructions",
      "equipment.id as equipmentId",
      "equipment.name as equipmentName",
      "muscle.id as muscleId",
      "muscle.name as muscleName",
    ]).execute();

  const exercisesMap = new Map<string, ExerciseDetail>();

  for (const row of data) {
    let exercise = exercisesMap.get(row.id);
    if (!exercise) {
      exercise = {
        id: row.id,
        exerciseName: row.exerciseName,
        instructions: row.instructions ? JSON.parse(row.instructions) : [],
        equipment: { id: row.equipmentId, name: row.equipmentName },
        muscles: [{ id: row.muscleId, name: row.muscleName }],
      };
      exercisesMap.set(row.id, exercise);
    } else {
      const muscleExists = exercise.muscles.find((m) => m.id === row.muscleId);
      if (!muscleExists) {
        exercise.muscles.push({ id: row.muscleId, name: row.muscleName });
      }
    }
  }

  const exercises = Array.from(exercisesMap.values());

  return exercises;
}

async function getEquipment() {
  return await db.selectFrom("equipment").select(["id", "name"]).execute();
}

async function getMuscles() {
  return await db.selectFrom("muscle").select(["id", "name"]).execute();
}

export { getEquipment, getExercises, getMuscles };
export type { ExerciseDetail };
