import Dexie, { type EntityTable } from "dexie";
import dexieCloud from "dexie-cloud-addon";
import { env } from "$env/dynamic/public";
import type {
  History,
  HistoryExercise,
  HistorySet,
  Workout,
  WorkoutExercise,
} from "./schema";

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
  databaseUrl: env.PUBLIC_DEXIE_CLOUD_DATABASE_URL,
});

export { db };
export type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise };
