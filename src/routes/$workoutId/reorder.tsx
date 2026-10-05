import { Navbar, Page, PageHeader } from "$lib/components";
import { db, type WorkoutExercise } from "$lib/db";
import { Button } from "$lib/eb";
import { arraymove } from "$lib/utils";
import { CaretDownIcon, CaretUpIcon, CheckIcon } from "@phosphor-icons/react";
import { createFileRoute } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useState } from "react";

export const Route = createFileRoute("/$workoutId/reorder")({
  component: Reorder,
});

function Reorder() {
  const { workoutId } = Route.useParams();

  const workout = useLiveQuery(() => db.workouts.get(workoutId), [workoutId]);
  const workoutExercises = useLiveQuery(
    () =>
      db.workoutExercises.where("workoutId").equals(workoutId).sortBy("order"),
    [workoutId],
  );

  // Local order while editing; null means "same as saved"
  const [ordered, setOrdered] = useState<WorkoutExercise[] | null>(null);
  const exercises = ordered ?? workoutExercises ?? [];

  const changed =
    ordered !== null &&
    ordered.some(
      (exercise, idx) => exercise.id !== workoutExercises?.[idx]?.id,
    );

  function move(from: number, to: number) {
    const next = [...exercises];
    arraymove(next, from, to);
    setOrdered(next);
  }

  async function saveChanges() {
    if (!ordered || !changed) return;

    await db.transaction("rw", [db.workoutExercises], async (tx) => {
      for (let i = 0; i < ordered.length; i++) {
        await tx.workoutExercises.update(ordered[i].id, { order: i + 1 });
      }
    });
    setOrdered(null);
  }

  return (
    <Page>
      <PageHeader title={workout?.name} />
      <ol className="divide-muted divide-y">
        {exercises.map((exercise, idx) => (
          <li
            key={exercise.id}
            className="flex items-center justify-between gap-4 py-4"
            style={{ viewTransitionName: `reorder-${exercise.id}` }}
          >
            <span className="text-base font-semibold">{exercise.name}</span>
            <span className="flex gap-2">
              <Button
                iconOnly
                aria-label={`Move ${exercise.name} up`}
                disabled={idx === 0}
                onClick={() => move(idx, idx - 1)}
              >
                <CaretUpIcon />
              </Button>
              <Button
                iconOnly
                aria-label={`Move ${exercise.name} down`}
                disabled={idx === exercises.length - 1}
                onClick={() => move(idx, idx + 1)}
              >
                <CaretDownIcon />
              </Button>
            </span>
          </li>
        ))}
      </ol>

      <Navbar backHref={`/${workoutId}`}>
        <Button
          variant="primary"
          className="flex-1"
          disabled={!changed}
          icon={<CheckIcon />}
          iconPosition="end"
          onClick={saveChanges}
        >
          Save changes
        </Button>
      </Navbar>
    </Page>
  );
}
