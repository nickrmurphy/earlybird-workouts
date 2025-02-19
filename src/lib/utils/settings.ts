import { weightUnitSchema, type WeightUnit } from "$lib/db";

function getDefaultWeightUnit(): WeightUnit {
  const def = localStorage.getItem("defaultWeightUnit");
  if (!def) {
    setDefaultWeightUnit("lbs");
  }

  return weightUnitSchema.parse(def || "lbs");
}

function setDefaultWeightUnit(unit: "lbs" | "kg") {
  localStorage.setItem("defaultWeightUnit", weightUnitSchema.parse(unit));
}

export { getDefaultWeightUnit, setDefaultWeightUnit };
