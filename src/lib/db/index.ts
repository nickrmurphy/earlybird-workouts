import Dexie, { type EntityTable } from "dexie";
import dexieCloud from "dexie-cloud-addon";

interface Workout {
  id: string;
  name: string;
}

interface WorkoutExercise {
  id: string;
  workoutId: string;
  exerciseId: string;
  name: string;
  sets: number;
  weight: number;
  count: number;
  order: number;
}

interface History {
  id: string;
  workoutId: string;
  workoutName: string;
  startTime: Date;
  endTime?: Date;
}

interface HistoryExercise {
  id: string;
  historyId: string;
  exerciseId: string;
  exerciseName: string;
}

interface HistorySet {
  id: string;
  historyId: string;
  historyExerciseId: string;
  exerciseId: string;
  count: number;
  weight: number;
  isSuccess: boolean;
}

const db = new Dexie("earlybird-workouts", {
  addons: [dexieCloud],
}) as Dexie & {
  workouts: EntityTable<Workout, "id">;
  workoutExercises: EntityTable<WorkoutExercise, "id">;
  history: EntityTable<History, "id">;
  historyExercises: EntityTable<HistoryExercise, "id">;
  historySets: EntityTable<HistorySet, "id">;
};

// Schema declaration:
db.version(1).stores({
  workouts: "@id, name", // primary key "id" (for the runtime!)
  workoutExercises: "@id, workoutId, exerciseId",
  history: "@id, workoutId, startTime, endTime",
  historyExercises: "@id, historyId, exerciseId",
  historySets: "@id, historyId, historyExerciseId, isSuccess",
});

db.cloud.configure({
  databaseUrl: "https://zxyluhdai.dexie.cloud",
});

export { db };
export type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise };
