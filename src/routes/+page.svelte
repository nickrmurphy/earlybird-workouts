<script lang="ts">
  import { goto } from "$app/navigation";
  import { SportsJogging } from "$lib/assets";
  import {
    WorkoutCard,
    EmptyMessage,
    Pressable,
    Page,
    PageHeader,
    InputDialog,
    Navbar,
    NavbarButton,
  } from "$lib/components";
  import {
    IconCirclePlus,
    IconReportAnalytics,
    IconSettings,
  } from "@tabler/icons-svelte";

  let showModal = $state(false);
  import { liveQuery } from "dexie";
  import { db } from "$lib/db";

  let workouts = liveQuery(() => db.workouts.toArray());
  let workoutExercises = liveQuery(() => db.workoutExercises.toArray());

  const createWorkout = async (name: string) => {
    if (!name) return;
    db.workouts.add({ name }).then((newId) => {
      goto(`/${newId}/exercises?complete=true`);
    });
  };

  function getWorkoutExercises(workoutId: string) {
    return (
      $workoutExercises
        ?.filter((exercise) => exercise.workoutId === workoutId)
        .map((e) => e.name) || []
    );
  }
</script>

<Page>
  <PageHeader title="Workouts">
    {#snippet right()}
      <button onclick={() => (showModal = true)}>
        <IconCirclePlus color="var(--color-accent)" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  <section class="flex flex-col gap-4 overflow-scroll">
    {#if $workouts?.length > 0}
      {#each $workouts as workout}
        <Pressable href={`/${workout.id}`}>
          <WorkoutCard
            workoutName={workout.name}
            exercises={getWorkoutExercises(workout.id)}
          />
        </Pressable>
      {/each}
    {:else}
      <EmptyMessage
        header="No workouts yet."
        message="Tap the plus button to add one."
      />
    {/if}
  </section>
  {#if $workouts?.length === 0}
    <SportsJogging />
  {/if}
  <Navbar>
    <NavbarButton class="invisible"></NavbarButton>
    <NavbarButton
      class="w-full"
      variant="secondary"
      onclick={() => goto("/history")}
    >
      History
      <IconReportAnalytics />
    </NavbarButton>
    <NavbarButton class="invisible" variant="secondary">
      <IconSettings />
    </NavbarButton>
  </Navbar>
</Page>

<InputDialog
  bind:open={showModal}
  title="Create a workout"
  onSubmit={createWorkout}
  submitText="Create"
  placeholder="e.g. Upper Body"
/>
