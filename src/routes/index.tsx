import { SportsJogging } from "$lib/assets";
import {
  EmptyMessage,
  InputDialog,
  Navbar,
  Page,
  PageHeader,
  SettingsDrawer,
  WorkoutCard,
} from "$lib/components";
import { db, getWorkoutsInfo } from "$lib/db";
import { Button } from "$lib/eb";
import {
  ClockCounterClockwiseIcon,
  GearIcon,
  PlusIcon,
} from "@phosphor-icons/react";
import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useState } from "react";

export const Route = createFileRoute("/")({
  component: Home,
});

function Home() {
  const navigate = useNavigate();
  const [showCreate, setShowCreate] = useState(false);
  const [showSettings, setShowSettings] = useState(false);

  const workouts = useLiveQuery(() => getWorkoutsInfo());

  async function createWorkout(name: string) {
    if (!name) return;
    const newId = await db.workouts.add({ name });
    navigate({
      to: "/$workoutId/exercises",
      params: { workoutId: newId },
      search: { complete: true },
    });
  }

  return (
    <Page>
      <PageHeader
        title="Workouts"
        actions={
          <Button
            variant="ghost"
            iconOnly
            aria-label="Create a workout"
            onClick={() => setShowCreate(true)}
          >
            <PlusIcon />
          </Button>
        }
      />
      <section className="flex flex-col gap-4">
        {workouts?.length === 0 ? (
          <>
            <EmptyMessage
              header="No workouts yet."
              message="Tap the plus button to add one."
            />
            <SportsJogging />
          </>
        ) : (
          workouts?.map((workout) => (
            <Link
              key={workout.id}
              to="/$workoutId"
              params={{ workoutId: workout.id }}
            >
              <WorkoutCard
                workoutName={workout.name}
                exercises={workout.exercises}
              />
            </Link>
          ))
        )}
      </section>

      <Navbar>
        <Button
          className="flex-1"
          icon={<ClockCounterClockwiseIcon />}
          iconPosition="end"
          onClick={() => navigate({ to: "/history" })}
        >
          History
        </Button>
        <Button
          iconOnly
          aria-label="Settings"
          onClick={() => setShowSettings(true)}
        >
          <GearIcon />
        </Button>
      </Navbar>

      <SettingsDrawer open={showSettings} onOpenChange={setShowSettings} />
      <InputDialog
        open={showCreate}
        onOpenChange={setShowCreate}
        title="Create a workout"
        submitText="Create"
        placeholder="e.g. Upper body"
        onSubmit={createWorkout}
      />
    </Page>
  );
}
