import { readJson, writeJson } from "https://deno.land/x/jsonfile/mod.ts";

interface Exercise {
  images?: string[];
  equipment: string | null;
  [key: string]: unknown;
}

async function cleanExercises(filePath: string) {
  try {
    const exercises = (await readJson(filePath)) as Exercise[];

    const cleanedExercises = exercises.map((exercise: Exercise) => {
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
