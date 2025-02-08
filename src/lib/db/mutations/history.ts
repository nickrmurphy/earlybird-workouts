import { db } from "../db";

async function deleteHistory(historyId: string) {
  return db.transaction(
    "rw",
    [db.history, db.historySets, db.historyExercises],
    async () => {
      await db.historySets.where("historyId").equals(historyId).delete();
      await db.historyExercises.where("historyId").equals(historyId).delete();
      await db.history.delete(historyId);
    },
  );
}

export { deleteHistory };
