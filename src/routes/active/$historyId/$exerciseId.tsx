import {
  ActiveExerciseSet,
  InstructionsDrawer,
  Navbar,
  Page,
  PageHeader,
  Sheet,
  TimerButton,
  WeightUnitSelect,
} from "$lib/components";
import { loadExerciseData } from "$lib/data/exerciseData";
import { db } from "$lib/db";
import { Button } from "$lib/eb";
import { activity } from "$lib/state";
import { InfoIcon, PencilSimpleIcon, PlusIcon, TrashIcon } from "@phosphor-icons/react";
import { createFileRoute, redirect } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useState } from "react";

export const Route = createFileRoute("/active/$historyId/$exerciseId")({
  loader: async ({ params }) => {
    const { allExercises } = await loadExerciseData();
    const details = allExercises.find((e) => e.id === params.exerciseId);

    if (!details) {
      throw redirect({
        to: "/active/$historyId",
        params: { historyId: params.historyId },
      });
    }

    return { details };
  },
  component: ActiveExercise,
});

function ActiveExercise() {
  const { historyId, exerciseId } = Route.useParams();
  const { details } = Route.useLoaderData();

  const [showEdit, setShowEdit] = useState(false);
  const [showInstructions, setShowInstructions] = useState(false);

  const sets = useLiveQuery(
    () =>
      db.historySets
        .where("historyId")
        .equals(historyId)
        .filter((set) => set.exerciseId === exerciseId)
        .toArray(),
    [historyId, exerciseId],
  );

  async function addSet() {
    const first = sets?.[0];
    if (!first) return;

    await db.historySets.add({
      historyId: first.historyId,
      historyExerciseId: first.historyExerciseId,
      exerciseId: first.exerciseId,
      count: first.count,
      weight: first.weight,
      weightUnit: first.weightUnit,
      countUnit: first.countUnit,
      isSuccess: false,
    });
  }

  return (
    <Page>
      <PageHeader
        title={details.name}
        actions={
          <>
            <Button
              variant="ghost"
              iconOnly
              aria-label="Edit sets"
              onClick={() => setShowEdit(true)}
            >
              <PencilSimpleIcon />
            </Button>
            <Button
              variant="ghost"
              iconOnly
              aria-label="Instructions"
              onClick={() => setShowInstructions(true)}
            >
              <InfoIcon />
            </Button>
          </>
        }
      />

      <div className="flex flex-col gap-5">
        {sets?.map((set, idx) => (
          <ActiveExerciseSet
            key={set.id}
            setIndex={idx}
            reps={set.count}
            weight={set.weight}
            weightUnit={set.weightUnit}
            isComplete={set.isSuccess}
            onToggleComplete={(isComplete) => {
              if (isComplete) {
                activity.restTimer.stop();
                activity.restTimer.start();
              }
              db.historySets.update(set.id, { isSuccess: isComplete });
            }}
            onRepsChange={(count) => db.historySets.update(set.id, { count })}
            onWeightChange={(weight) => db.historySets.update(set.id, { weight })}
          />
        ))}
      </div>

      <Navbar backHref={`/active/${historyId}`}>
        <TimerButton />
        <Button iconOnly aria-label="Add a set" onClick={addSet}>
          <PlusIcon />
        </Button>
      </Navbar>

      <Sheet
        open={showEdit}
        onOpenChange={setShowEdit}
        title="Edit sets"
        description="Change units or remove sets."
      >
        {sets?.map((set, idx) => (
          <div key={set.id} className="flex items-center gap-3">
            <div className="flex min-w-0 flex-1 flex-col">
              <span className="font-semibold">Set {idx + 1}</span>
              <span className="text-muted-foreground">
                {set.count} reps × {set.weight} {set.weightUnit}
              </span>
            </div>
            <WeightUnitSelect
              className="w-28 [&_.eb-label]:sr-only"
              label={`Set ${idx + 1} unit`}
              value={set.weightUnit}
              onValueChange={(weightUnit) => db.historySets.update(set.id, { weightUnit })}
            />
            <Button
              variant="ghost"
              iconOnly
              className="text-danger"
              aria-label={`Remove set ${idx + 1}`}
              disabled={sets.length === 1}
              onClick={() => db.historySets.delete(set.id)}
            >
              <TrashIcon />
            </Button>
          </div>
        ))}
      </Sheet>

      <InstructionsDrawer
        open={showInstructions}
        onOpenChange={setShowInstructions}
        name="Instructions"
        instructions={details.instructions ?? []}
      />
    </Page>
  );
}
