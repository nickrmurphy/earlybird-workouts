import type { WeightUnit } from "$lib/database/database";

function getDefaultWeightUnit(): WeightUnit {
  const def = localStorage.getItem("defaultWeightUnit");
  if (!def) {
    setDefaultWeightUnit("lb");
  }

  if (def === "lb" || def === "kg") {
    return def;
  } else {
    console.error("Invalid default weight unit:", def);
    return "lb";
  }
}

function setDefaultWeightUnit(unit: "lb" | "kg") {
  localStorage.setItem("defaultWeightUnit", unit);
}

function getWelcomed() {
  return localStorage.getItem("welcomed") === "true";
}

function setWelcomed(value: boolean) {
  localStorage.setItem("welcomed", value.toString());
}

export { getDefaultWeightUnit, getWelcomed, setDefaultWeightUnit, setWelcomed };
