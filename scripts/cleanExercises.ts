import { readJson, writeJson } from "https://deno.land/x/jsonfile/mod.ts";

async function cleanExercises(filePath: string) {
  try {
    const exercises = (await readJson(filePath)) as Array<any>;

    const cleanedExercises = exercises.map((exercise) => {
      delete exercise.images;
      if (exercise.equipment === "body only") {
        exercise.equipment = null;
      }
      return exercise;
    });

    await writeJson(filePath, cleanedExercises, { spaces: 2 });
    console.log("Exercises cleaned successfully.");
  } catch (error) {
    console.error("Error cleaning exercises:", error);
  }
}

const filePath = "./static/exercises.json"; // Update with the correct path to your JSON file
cleanExercises(filePath);
