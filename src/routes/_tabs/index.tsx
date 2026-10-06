import { SportsJogging } from "$lib/assets";
import { EmptyMessage, InputDialog, Page, PageHeader, WorkoutCard } from "$lib/components";
import { db, getWorkoutsInfo } from "$lib/db";
import { Button } from "$lib/eb";
import { PlusIcon } from "@phosphor-icons/react";
import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useState } from "react";

export const Route = createFileRoute("/_tabs/")({
  component: Home,
});

function Home() {
  const navigate = useNavigate();
  const [showCreate, setShowCreate] = useState(false);

  const workouts = useLiveQuery(() => getWorkoutsInfo());

  async function createWorkout(name: string) {
    if (!name) return;
    const newId = await db.workouts.add({ name });
    navigate({
      to: "/$workoutId/exercises",
      params: { workoutId: newId },
      search: { add: true },
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
            <EmptyMessage header="No workouts yet." message="Tap the plus button to add one." />
            <SportsJogging />
          </>
        ) : (
          workouts?.map((workout) => (
            <Link key={workout.id} to="/$workoutId" params={{ workoutId: workout.id }}>
              <WorkoutCard workoutName={workout.name} exercises={workout.exercises} />
            </Link>
          ))
        )}
      </section>

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
