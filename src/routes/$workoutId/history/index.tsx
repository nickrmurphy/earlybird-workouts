import { BusinessClipboard } from "$lib/assets";
import { EmptyMessage, HistoryCard, Page, PageHeader } from "$lib/components";
import { db } from "$lib/db";
import { calculateTonnagePerAttribute } from "$lib/utils";
import { createFileRoute, Link } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useMemo } from "react";

export const Route = createFileRoute("/$workoutId/history/")({
  component: WorkoutHistory,
});

function WorkoutHistory() {
  const { workoutId } = Route.useParams();

  const workout = useLiveQuery(() => db.workouts.get(workoutId), [workoutId]);
  const history = useLiveQuery(
    () => db.history.where("workoutId").equals(workoutId).reverse().sortBy("startTime"),
    [workoutId],
  );
  const successSets = useLiveQuery(async () => {
    const historyIds = (await db.history
      .where("workoutId")
      .equals(workoutId)
      .primaryKeys()) as string[];
    return db.historySets
      .where("historyId")
      .anyOf(historyIds)
      .filter((set) => set.isSuccess)
      .toArray();
  }, [workoutId]);

  const tonnage = useMemo(
    () => calculateTonnagePerAttribute(successSets ?? [], (s) => s.historyId),
    [successSets],
  );

  return (
    <Page>
      <PageHeader title={workout?.name} backHref={`/${workoutId}`}>
        <p className="text-accent font-semibold">History</p>
      </PageHeader>
      {history?.length === 0 && (
        <>
          <EmptyMessage header="No history yet." message="Past workout details will appear here." />
          <BusinessClipboard />
        </>
      )}
      <section className="flex flex-col gap-4">
        {history?.map((item) => (
          <Link
            key={item.id}
            to="/$workoutId/history/$historyId"
            params={{ workoutId, historyId: item.id }}
          >
            <HistoryCard
              startTime={item.startTime}
              endTime={item.endTime}
              tonnage={tonnage.get(item.id) ?? 0}
            />
          </Link>
        ))}
      </section>
    </Page>
  );
}
