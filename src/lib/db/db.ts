import Dexie, { type EntityTable } from "dexie";
import type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise } from "./schema";

const db = new Dexie("earlybird-workouts") as Dexie & {
  workouts: EntityTable<Workout, "id">;
  workoutExercises: EntityTable<WorkoutExercise, "id">;
  history: EntityTable<History, "id">;
  historyExercises: EntityTable<HistoryExercise, "id">;
  historySets: EntityTable<HistorySet, "id">;
};

// Schema declaration:
db.version(1).stores({
  workouts: "id, name",
  workoutExercises: "id, workoutId, exerciseId",
  history: "id, workoutId, startTime, endTime",
  historyExercises: "id, historyId, exerciseId",
  historySets: "id, historyId, historyExerciseId, isSuccess",
});

// Every row gets a string UUID primary key unless one is given
for (const table of db.tables) {
  table.hook("creating", (primKey, obj) => {
    if (primKey === undefined) return (obj.id = crypto.randomUUID());
  });
}

export { db };
export type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise };
