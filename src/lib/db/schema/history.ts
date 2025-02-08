import { z } from "zod";
import { trackExerciseSchema } from "./workouts";

const historySchema = z.object({
  id: z.string(),
  workoutId: z.string(),
  workoutName: z.string(),
  startTime: z.date(),
  endTime: z.date().optional(),
});

const historyExerciseSchema = z.object({
  id: z.string(),
  historyId: z.string(),
  exerciseId: z.string(),
  exerciseName: z.string(),
});

const historySetSchema = trackExerciseSchema.extend({
  id: z.string(),
  historyId: z.string(),
  historyExerciseId: z.string(),
  exerciseId: z.string(),
  isSuccess: z.boolean(),
});

type History = z.infer<typeof historySchema>;
type HistoryExercise = z.infer<typeof historyExerciseSchema>;
type HistorySet = z.infer<typeof historySetSchema>;

export { historyExerciseSchema, historySchema, historySetSchema };
export type { History, HistoryExercise, HistorySet };
