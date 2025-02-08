import { z } from "zod";

const workoutSchema = z.object({
  id: z.string(),
  name: z.string(),
});

const weightUnitSchema = z.union([z.literal("kg"), z.literal("lbs")]);
const countUnitSchema = z.union([z.literal("reps"), z.literal("sec")]);

const trackExerciseSchema = z.object({
  weight: z.number().gte(0),
  count: z.number().gte(0),
  weightUnit: weightUnitSchema,
  countUnit: countUnitSchema,
});

const workoutExerciseSchema = trackExerciseSchema.extend({
  id: z.string(),
  workoutId: z.string(),
  exerciseId: z.string(),
  name: z.string(),
  sets: z.number().gte(0),
  order: z.number().gte(0),
});

type Workout = z.infer<typeof workoutSchema>;
type WorkoutExercise = z.infer<typeof workoutExerciseSchema>;
type WeightUnit = z.infer<typeof weightUnitSchema>;
type CountUnit = z.infer<typeof countUnitSchema>;

export {
  countUnitSchema,
  trackExerciseSchema,
  weightUnitSchema,
  workoutExerciseSchema,
  workoutSchema,
};
export type { CountUnit, WeightUnit, Workout, WorkoutExercise };
