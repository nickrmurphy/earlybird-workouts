import Dexie, { type EntityTable } from "dexie";

interface Workout {
  id: number;
  name: string;
}

interface WorkoutExercise {
  id: number;
  workoutId: number;
  exerciseId: string;
  name: string;
  sets: number;
  weight: number;
  count: number;
  order: number;
}

interface History {
  id: number;
  workoutId: number;
  workoutName: string;
  startTime: Date;
  endTime?: Date;
}

interface HistoryExercise {
  id: number;
  historyId: number;
  exerciseId: string;
  exerciseName: string;
}

interface HistorySet {
  id: number;
  historyId: number;
  historyExerciseId: number;
  exerciseId: string;
  count: number;
  weight: number;
  isSuccess: boolean;
}

const db = new Dexie("earlybird-workouts") as Dexie & {
  workouts: EntityTable<Workout, "id">;
  workoutExercises: EntityTable<WorkoutExercise, "id">;
  history: EntityTable<History, "id">;
  historyExercises: EntityTable<HistoryExercise, "id">;
  historySets: EntityTable<HistorySet, "id">;
};

// Schema declaration:
db.version(1).stores({
  workouts: "++id, name", // primary key "id" (for the runtime!)
  workoutExercises: "++id, workoutId, exerciseId, name, sets, count",
  history: "++id, workoutId, workoutName, startTime, endTime",
  historyExercises: "++id, historyId, exerciseId, exerciseName",
  historySets: "++id, historyId, historyExerciseId, count, weight, isSuccess",
});

export { db };
export type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise };
