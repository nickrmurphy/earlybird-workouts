import { readJson, writeJson } from "https://deno.land/x/jsonfile/mod.ts";

async function extractProperties(filePath: string) {
  try {
    const exercises = (await readJson(filePath)) as Array<any>;

    const uniqueForces = new Set<string>();
    const uniqueLevels = new Set<string>();
    const uniqueMechanics = new Set<string>();
    const uniqueEquipment = new Set<string>();
    const uniqueMuscles = new Set<string>();
    const uniqueCategories = new Set<string>();

    exercises.forEach((exercise) => {
      if (exercise.force) uniqueForces.add(exercise.force);
      if (exercise.level) uniqueLevels.add(exercise.level);
      if (exercise.mechanic) uniqueMechanics.add(exercise.mechanic);
      if (exercise.equipment) uniqueEquipment.add(exercise.equipment);
      exercise.primaryMuscles
        .filter((muscle: string) => muscle)
        .forEach((muscle: string) => uniqueMuscles.add(muscle));
      exercise.secondaryMuscles
        .filter((muscle: string) => muscle)
        .forEach((muscle: string) => uniqueMuscles.add(muscle));
      if (exercise.category) uniqueCategories.add(exercise.category);
    });

    const toTitleCase = (str: string) =>
      str.replace(
        /\w\S*/g,
        (txt) => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(),
      );

    const formatToLabelValue = (set: Set<string>) =>
      Array.from(set).map((item) => ({
        label: toTitleCase(item),
        value: item,
      }));

    await writeJson("./static/forces.json", formatToLabelValue(uniqueForces), {
      spaces: 2,
    });
    await writeJson("./static/levels.json", formatToLabelValue(uniqueLevels), {
      spaces: 2,
    });
    await writeJson(
      "./static/mechanics.json",
      formatToLabelValue(uniqueMechanics),
      {
        spaces: 2,
      },
    );
    await writeJson(
      "./static/equipment.json",
      formatToLabelValue(uniqueEquipment),
      {
        spaces: 2,
      },
    );
    await writeJson(
      "./static/muscles.json",
      formatToLabelValue(uniqueMuscles),
      {
        spaces: 2,
      },
    );
    await writeJson(
      "./static/categories.json",
      formatToLabelValue(uniqueCategories),
      {
        spaces: 2,
      },
    );

    console.log("Properties extracted and written to JSON files successfully.");
  } catch (error) {
    console.error("Error extracting properties:", error);
  }
}

const filePath = "./static/exercises.json"; // Update with the correct path to your JSON file
extractProperties(filePath);
