import {
  ActiveExerciseCard,
  EmptyMessage,
  Page,
  PageHeader,
  Sheet,
  TimerButton,
  TimerDisplay,
  Toolbar,
} from "$lib/components";
import { db, type Exercise } from "$lib/db";
import { Button, Input, Select, type SelectProps } from "$lib/eb";
import { activity, confirm, useExerciseSearch, useRestTimer, useTimer } from "$lib/state";
import { getDefaultWeightUnit } from "$lib/utils";
import {
  CheckCircleIcon,
  ChecksIcon,
  PlusIcon,
  SlidersHorizontalIcon,
} from "@phosphor-icons/react";
import { createFileRoute, getRouteApi, Link, useNavigate } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useEffect, useState } from "react";

const restTimeOptions: SelectProps["items"] = [10, 20, 30, 45, 60, 90, 120, 180].map((seconds) => ({
  label: `${seconds}s`,
  value: String(seconds),
}));

// Exercise data is loaded once by the parent /active route
const activeRoute = getRouteApi("/active");

export const Route = createFileRoute("/active/$historyId/")({
  component: ActiveWorkout,
});

function ActiveWorkout() {
  const { historyId } = Route.useParams();
  const { allExercises } = activeRoute.useLoaderData();
  const navigate = useNavigate();
  const timer = useTimer();
  const restTimer = useRestTimer();

  const [settingsOpen, setSettingsOpen] = useState(false);
  const [addOpen, setAddOpen] = useState(false);

  const activeWorkout = useLiveQuery(() => db.history.get(historyId), [historyId]);
  const exercises = useLiveQuery(
    () => db.historyExercises.where("historyId").equals(historyId).toArray(),
    [historyId],
  );
  const exerciseSets = useLiveQuery(
    () => db.historySets.where("historyId").equals(historyId).toArray(),
    [historyId],
  );

  // Resume the elapsed timer from the saved start time (e.g. after a reload)
  const startTime = activeWorkout?.startTime;
  useEffect(() => {
    if (startTime && !activity.timer.isRunning) {
      activity.timer.start(startTime);
    }
  }, [startTime]);

  async function confirmEndWorkout() {
    const confirmed = await confirm("This action cannot be reverted. Are you sure?", {
      title: "End workout",
      okLabel: "Finish",
    });
    if (!confirmed || !activeWorkout) return;

    await db.history.update(historyId, { endTime: new Date() });
    activity.clearCurrentId();
    navigate({
      to: "/$workoutId/history/$historyId",
      params: { workoutId: activeWorkout.workoutId, historyId },
    });
  }

  async function addExercise(exercise: Exercise) {
    if (exercises?.some((e) => e.exerciseId === exercise.id)) return;

    await db.transaction("rw", [db.historyExercises, db.historySets], async () => {
      const historyExerciseId = await db.historyExercises.add({
        historyId,
        exerciseName: exercise.name,
        exerciseId: exercise.id,
      });

      await db.historySets.add({
        historyId,
        historyExerciseId,
        exerciseId: exercise.id,
        count: 10,
        weight: 40,
        isSuccess: false,
        weightUnit: getDefaultWeightUnit(),
        countUnit: "reps",
      });
    });
  }

  return (
    <Page>
      <PageHeader
        title={activeWorkout?.workoutName}
        actions={
          <>
            {activeWorkout && <TimerDisplay elapsedSeconds={timer.seconds} />}
            <Button
              variant="ghost"
              iconOnly
              aria-label="Finish workout"
              className="text-accent"
              onClick={confirmEndWorkout}
            >
              <ChecksIcon />
            </Button>
          </>
        }
      />

      {exercises?.length === 0 && (
        <EmptyMessage header="No exercises yet." message="Tap the plus button to add one." />
      )}
      <section className="flex flex-col gap-4">
        {exercises?.map((exercise) => {
          const sets = exerciseSets?.filter((s) => s.exerciseId === exercise.exerciseId) ?? [];
          return (
            <Link
              key={exercise.id}
              to="/active/$historyId/$exerciseId"
              params={{ historyId, exerciseId: exercise.exerciseId }}
            >
              <ActiveExerciseCard
                exerciseName={exercise.exerciseName}
                setCount={sets.length}
                completeSets={sets.filter((s) => s.isSuccess).length}
              />
            </Link>
          );
        })}
      </section>

      <Toolbar>
        <Button iconOnly aria-label="Rest timer settings" onClick={() => setSettingsOpen(true)}>
          <SlidersHorizontalIcon />
        </Button>
        <TimerButton />
        <Button iconOnly aria-label="Add an exercise" onClick={() => setAddOpen(true)}>
          <PlusIcon />
        </Button>
      </Toolbar>

      <Sheet open={settingsOpen} onOpenChange={setSettingsOpen} title="Activity settings">
        <Select
          label="Rest time"
          items={restTimeOptions}
          value={String(restTimer.runTimeSeconds)}
          onValueChange={(seconds) => {
            if (seconds) activity.restTimer.runTimeSeconds = Number(seconds);
          }}
        />
      </Sheet>

      <AddExerciseSheet
        open={addOpen}
        onOpenChange={setAddOpen}
        exercises={allExercises}
        addedIds={exercises?.map((e) => e.exerciseId) ?? []}
        onAdd={(exercise) => {
          setAddOpen(false);
          addExercise(exercise);
        }}
      />
    </Page>
  );
}

function AddExerciseSheet({
  open,
  onOpenChange,
  exercises,
  addedIds,
  onAdd,
}: {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  exercises: Exercise[];
  addedIds: string[];
  onAdd: (exercise: Exercise) => void;
}) {
  const search = useExerciseSearch(exercises);

  return (
    <Sheet open={open} onOpenChange={onOpenChange} title="Add an exercise">
      <Input
        type="search"
        aria-label="Search exercises"
        placeholder="Search exercises"
        value={search.term}
        onChange={(event) => search.setTerm(event.currentTarget.value)}
      />
      <ul className="divide-muted divide-y">
        {search.filteredOptions.map((exercise) => {
          const added = addedIds.includes(exercise.id);
          return (
            <li key={exercise.id}>
              <button
                type="button"
                disabled={added}
                className="flex w-full cursor-pointer items-center justify-between gap-3 py-3 text-left text-base disabled:cursor-default disabled:opacity-45"
                onClick={() => onAdd(exercise)}
              >
                {exercise.name}
                {added && (
                  <CheckCircleIcon
                    size={20}
                    weight="fill"
                    className="text-accent shrink-0"
                    aria-label="Added"
                  />
                )}
              </button>
            </li>
          );
        })}
      </ul>
    </Sheet>
  );
}
