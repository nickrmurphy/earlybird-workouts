import { BusinessClipboard } from "$lib/assets";
import { EmptyMessage, HistoryCard, Navbar, Page, PageHeader } from "$lib/components";
import { db } from "$lib/db";
import { calculateTonnagePerAttribute } from "$lib/utils";
import { SpinnerIcon } from "@phosphor-icons/react";
import { createFileRoute, Link } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useMemo } from "react";

export const Route = createFileRoute("/history")({
  component: History,
});

function History() {
  const history = useLiveQuery(() => db.history.orderBy("startTime").reverse().toArray());
  const successSets = useLiveQuery(() => db.historySets.filter((set) => set.isSuccess).toArray());

  const tonnage = useMemo(
    () => calculateTonnagePerAttribute(successSets ?? [], (s) => s.historyId),
    [successSets],
  );

  return (
    <Page>
      <PageHeader title="History" />
      {!history ? (
        <SpinnerIcon className="mx-auto mt-30 animate-spin" />
      ) : history.length === 0 ? (
        <>
          <EmptyMessage header="No history yet." message="Past workout details will appear here." />
          <BusinessClipboard />
        </>
      ) : (
        <section className="flex flex-col gap-4">
          {history.map((item) => (
            <Link
              key={item.id}
              to="/$workoutId/history/$historyId"
              params={{ workoutId: item.workoutId, historyId: item.id }}
              search={{ from: "/history" }}
            >
              <HistoryCard
                workoutName={item.workoutName}
                startTime={item.startTime}
                endTime={item.endTime}
                tonnage={tonnage.get(item.id) ?? 0}
              />
            </Link>
          ))}
        </section>
      )}
      <Navbar backHref="/" />
    </Page>
  );
}
