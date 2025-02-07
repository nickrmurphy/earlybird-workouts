import { z } from "zod";

const workoutSchema = z.object({
  id: z.string(),
  name: z.string(),
});

const unitSchema = z.union([
  z.literal("kg"),
  z.literal("lbs"),
  z.literal("sec"),
]);

const workoutExerciseSchema = z.object({
  id: z.string(),
  workoutId: z.string(),
  exerciseId: z.string(),
  name: z.string(),
  sets: z.number(),
  weight: z.number(),
  count: z.number(),
  unit: unitSchema,
  order: z.number(),
});

type Workout = z.infer<typeof workoutSchema>;
type WorkoutExercise = z.infer<typeof workoutExerciseSchema>;
type Unit = z.infer<typeof unitSchema>;

export { unitSchema, workoutExerciseSchema, workoutSchema };
export type { Unit, Workout, WorkoutExercise };
