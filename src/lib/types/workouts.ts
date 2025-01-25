import type { Exercise } from "./exercises";

export type Workout = {
  id: string;
  name: string;
};

export type PopulatedWorkout = Workout & {
  exercises: Pick<Exercise, "id" | "name">[];
};
