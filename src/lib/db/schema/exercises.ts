import { z } from "zod";

const forceSchema = z.union([
  z.literal("pull"),
  z.literal("push"),
  z.literal("static"),
]);

const levelSchema = z.union([
  z.literal("beginner"),
  z.literal("intermediate"),
  z.literal("expert"),
]);

const mechanicSchema = z.union([z.literal("compound"), z.literal("isolation")]);

const equipmentSchema = z.union([
  z.literal("machine"),
  z.literal("other"),
  z.literal("foam roll"),
  z.literal("kettlebells"),
  z.literal("dumbbell"),
  z.literal("cable"),
  z.literal("barbell"),
  z.literal("bands"),
  z.literal("medicine ball"),
  z.literal("exercise ball"),
  z.literal("e-z curl bar"),
]);

const muscleSchema = z.union([
  z.literal("abdominals"),
  z.literal("hamstrings"),
  z.literal("calves"),
  z.literal("shoulders"),
  z.literal("adductors"),
  z.literal("glutes"),
  z.literal("quadriceps"),
  z.literal("biceps"),
  z.literal("forearms"),
  z.literal("abductors"),
  z.literal("triceps"),
  z.literal("chest"),
  z.literal("lower back"),
  z.literal("traps"),
  z.literal("middle back"),
  z.literal("lats"),
  z.literal("neck"),
]);

const categorySchema = z.union([
  z.literal("strength"),
  z.literal("stretching"),
  z.literal("plyometrics"),
  z.literal("strongman"),
  z.literal("powerlifting"),
  z.literal("cardio"),
  z.literal("olympic weightlifting"),
]);

const exerciseSchema = z.object({
  id: z.string(),
  name: z.string(),
  force: forceSchema.nullable(),
  level: levelSchema,
  mechanic: mechanicSchema.nullable(),
  equipment: equipmentSchema.nullable(),
  primaryMuscles: z.array(muscleSchema),
  secondaryMuscles: z.array(muscleSchema),
  instructions: z.array(z.string()),
  category: categorySchema,
});

const discreteForce = z.object({
  label: z.string(),
  value: forceSchema,
});

const discreteLevel = z.object({
  label: z.string(),
  value: levelSchema,
});

const discreteMechanic = z.object({
  label: z.string(),
  value: mechanicSchema,
});

const discreteEquipment = z.object({
  label: z.string(),
  value: equipmentSchema,
});

const discreteMuscle = z.object({
  label: z.string(),
  value: muscleSchema,
});

const discreteCategory = z.object({
  label: z.string(),
  value: categorySchema,
});

type Exercise = z.infer<typeof exerciseSchema>;
type Force = z.infer<typeof forceSchema>;
type Level = z.infer<typeof levelSchema>;
type Mechanic = z.infer<typeof mechanicSchema>;
type Equipment = z.infer<typeof equipmentSchema>;
type Muscle = z.infer<typeof muscleSchema>;
type Category = z.infer<typeof categorySchema>;
type DiscreteForce = z.infer<typeof discreteForce>;
type DiscreteLevel = z.infer<typeof discreteLevel>;
type DiscreteMechanic = z.infer<typeof discreteMechanic>;
type DiscreteEquipment = z.infer<typeof discreteEquipment>;
type DiscreteMuscle = z.infer<typeof discreteMuscle>;
type DiscreteCategory = z.infer<typeof discreteCategory>;

export {
  categorySchema,
  discreteCategory,
  discreteEquipment,
  discreteForce,
  discreteLevel,
  discreteMechanic,
  discreteMuscle,
  equipmentSchema,
  exerciseSchema,
  forceSchema,
  levelSchema,
  mechanicSchema,
  muscleSchema,
};

export type {
  Category,
  DiscreteCategory,
  DiscreteEquipment,
  DiscreteForce,
  DiscreteLevel,
  DiscreteMechanic,
  DiscreteMuscle,
  Equipment,
  Exercise,
  Force,
  Level,
  Mechanic,
  Muscle,
};
