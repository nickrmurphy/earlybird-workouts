import { ExerciseSetsTable, Page, PageHeader } from "$lib/components";
import { db, deleteHistory } from "$lib/db";
import { Button, Menu } from "$lib/eb";
import { confirm } from "$lib/state";
import { calculateTonnage, dateDifferenceInMinutes, dateFormatter } from "$lib/utils";
import { BarbellIcon, ClockIcon, DotsThreeCircleIcon, TrashIcon } from "@phosphor-icons/react";
import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";

type Search = {
  /** In-app path to go back to, e.g. the global history list */
  from?: string;
};

export const Route = createFileRoute("/$workoutId/history/$historyId")({
  validateSearch: (search: Record<string, unknown>): Search => ({
    from: typeof search.from === "string" && search.from.startsWith("/") ? search.from : undefined,
  }),
  component: HistoryDetail,
});

function HistoryDetail() {
  const { workoutId, historyId } = Route.useParams();
  const { from } = Route.useSearch();
  const navigate = useNavigate();

  const history = useLiveQuery(() => db.history.get(historyId), [historyId]);
  const exercises = useLiveQuery(
    () => db.historyExercises.where("historyId").equals(historyId).toArray(),
    [historyId],
  );
  const historySets = useLiveQuery(
    () => db.historySets.where("historyId").equals(historyId).toArray(),
    [historyId],
  );

  const runTime = history?.endTime && dateDifferenceInMinutes(history.startTime, history.endTime);
  const tonnage = historySets ? calculateTonnage(historySets) : undefined;
  const backHref = from ?? `/${workoutId}/history`;

  async function confirmDelete() {
    const confirmed = await confirm("This action cannot be reverted. Are you sure?", {
      title: "Delete history",
      okLabel: "Delete",
    });

    if (confirmed) {
      await deleteHistory(historyId);
      navigate({ href: backHref });
    }
  }

  return (
    <Page>
      <PageHeader
        title={history?.workoutName}
        backHref={backHref}
        actions={
          <Menu>
            <Menu.Trigger
              render={
                <Button
                  variant="ghost"
                  iconOnly
                  aria-label="History options"
                  icon={<DotsThreeCircleIcon />}
                />
              }
            />
            <Menu.Content align="end">
              <Menu.Item tone="danger" icon={<TrashIcon />} onClick={confirmDelete}>
                Delete
              </Menu.Item>
            </Menu.Content>
          </Menu>
        }
      >
        {history && (
          <p className="text-accent font-semibold">{dateFormatter.format(history.startTime)}</p>
        )}
      </PageHeader>

      <div className="flex items-center justify-between text-lg font-semibold">
        <span className="flex items-center gap-2">
          <ClockIcon size={20} />
          {runTime ?? "–"} min
        </span>
        <span className="flex items-center gap-2">
          <BarbellIcon size={20} />
          {tonnage === undefined ? "–" : Math.round(tonnage).toLocaleString()} lbs
        </span>
      </div>

      {exercises?.map((exercise) => (
        <ExerciseSetsTable
          key={exercise.id}
          exerciseName={exercise.exerciseName}
          sets={historySets?.filter((s) => s.exerciseId === exercise.exerciseId) ?? []}
        />
      ))}
    </Page>
  );
}
