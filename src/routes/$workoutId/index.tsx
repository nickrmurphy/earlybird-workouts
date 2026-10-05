import { NavigationMonitor } from "$lib/assets";
import {
  EmptyMessage,
  ExerciseDrawer,
  ExerciseItem,
  InputDialog,
  Navbar,
  Page,
  PageHeader,
} from "$lib/components";
import { createWorkoutHistoryAndExerciseSets, db, deleteWorkout } from "$lib/db";
import { Button, Menu } from "$lib/eb";
import { activity, confirm } from "$lib/state";
import {
  ArrowsDownUpIcon,
  ClockCounterClockwiseIcon,
  DotsThreeCircleIcon,
  PencilSimpleIcon,
  PlusIcon,
  PlusMinusIcon,
  RocketLaunchIcon,
  TrashIcon,
} from "@phosphor-icons/react";
import { createFileRoute, getRouteApi, useNavigate } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useState } from "react";

// Exercise data is loaded once by the parent /$workoutId route
const workoutRoute = getRouteApi("/$workoutId");

export const Route = createFileRoute("/$workoutId/")({
  component: WorkoutDetail,
});

function WorkoutDetail() {
  const { workoutId } = Route.useParams();
  const { allExercises } = workoutRoute.useLoaderData();
  const navigate = useNavigate();

  const [showRename, setShowRename] = useState(false);
  const [drawerOpen, setDrawerOpen] = useState(false);
  const [selectedId, setSelectedId] = useState<string | null>(null);

  const workout = useLiveQuery(() => db.workouts.get(workoutId), [workoutId]);
  const workoutExercises = useLiveQuery(
    () => db.workoutExercises.where("workoutId").equals(workoutId).sortBy("order"),
    [workoutId],
  );

  // Kept after close so the drawer can animate out
  const selected = workoutExercises?.find((e) => e.id === selectedId);
  const hasExercises = (workoutExercises?.length ?? 0) > 0;

  async function confirmDelete() {
    const confirmed = await confirm("This action cannot be reverted. Are you sure?", {
      title: "Delete workout",
      okLabel: "Delete",
    });

    if (confirmed) {
      await deleteWorkout(workoutId);
      navigate({ to: "/" });
    }
  }

  async function startWorkout() {
    const historyId = await createWorkoutHistoryAndExerciseSets(workoutId);
    activity.setCurrentId(historyId);
    navigate({ to: "/active/$historyId", params: { historyId } });
  }

  return (
    <Page>
      {workout && (
        <PageHeader
          title={workout.name}
          actions={
            <>
              <Button
                variant="ghost"
                iconOnly
                aria-label="Reorder exercises"
                disabled={!hasExercises}
                onClick={() => navigate({ to: "/$workoutId/reorder", params: { workoutId } })}
              >
                <ArrowsDownUpIcon />
              </Button>
              <Button
                variant="ghost"
                iconOnly
                aria-label={hasExercises ? "Edit exercises" : "Add exercises"}
                onClick={() =>
                  navigate({
                    to: "/$workoutId/exercises",
                    params: { workoutId },
                  })
                }
              >
                {hasExercises ? <PlusMinusIcon /> : <PlusIcon />}
              </Button>
              <Menu>
                <Menu.Trigger
                  render={
                    <Button
                      variant="ghost"
                      iconOnly
                      aria-label="Workout options"
                      icon={<DotsThreeCircleIcon />}
                    />
                  }
                />
                <Menu.Content align="end">
                  <Menu.Item icon={<PencilSimpleIcon />} onClick={() => setShowRename(true)}>
                    Rename
                  </Menu.Item>
                  <Menu.Separator />
                  <Menu.Item tone="danger" icon={<TrashIcon />} onClick={confirmDelete}>
                    Delete
                  </Menu.Item>
                </Menu.Content>
              </Menu>
            </>
          }
        />
      )}

      {workoutExercises && (
        <section className="flex flex-col gap-3">
          {workoutExercises.length === 0 ? (
            <>
              <EmptyMessage
                header="No exercises yet."
                message="Tap the plus button to add an exercise."
              />
              <NavigationMonitor />
            </>
          ) : (
            workoutExercises.map((exercise) => (
              <ExerciseItem
                key={exercise.id}
                name={exercise.name}
                sets={exercise.sets}
                reps={exercise.count}
                weight={exercise.weight}
                weightUnit={exercise.weightUnit}
                onClick={() => {
                  setSelectedId(exercise.id);
                  setDrawerOpen(true);
                }}
              />
            ))
          )}
        </section>
      )}

      {selected && (
        <ExerciseDrawer
          key={selected.id}
          open={drawerOpen}
          onOpenChange={setDrawerOpen}
          name={selected.name}
          instructions={allExercises.find((e) => e.id === selected.exerciseId)?.instructions}
          defaultWeight={selected.weight}
          defaultWeightUnit={selected.weightUnit}
          defaultSets={selected.sets}
          defaultReps={selected.count}
          onWeightChange={(weight) => db.workoutExercises.update(selected.id, { weight })}
          onWeightUnitChange={(weightUnit) =>
            db.workoutExercises.update(selected.id, { weightUnit })
          }
          onSetsChange={(sets) => db.workoutExercises.update(selected.id, { sets })}
          onRepsChange={(count) => db.workoutExercises.update(selected.id, { count })}
        />
      )}

      <InputDialog
        open={showRename}
        onOpenChange={setShowRename}
        title="Rename workout"
        submitText="Save"
        defaultValue={workout?.name}
        onSubmit={(name) => {
          if (name) db.workouts.update(workoutId, { name });
        }}
      />

      <Navbar backHref="/">
        <Button
          variant="primary"
          className="flex-1"
          icon={<RocketLaunchIcon />}
          iconPosition="end"
          onClick={startWorkout}
        >
          Start workout
        </Button>
        <Button
          iconOnly
          aria-label="Workout history"
          onClick={() => navigate({ to: "/$workoutId/history", params: { workoutId } })}
        >
          <ClockCounterClockwiseIcon />
        </Button>
      </Navbar>
    </Page>
  );
}
