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
  } from "$lib/components";
  import {
    IconCirclePlus,
    IconReportAnalytics,
    IconSettings,
  } from "@tabler/icons-svelte";

  let showIllustration = $state(false);
  let showModal = $state(false);
  import { liveQuery } from "dexie";
  import { db } from "$lib/db";
  import NavbarButton from "$lib/components/page/NavbarButton.svelte";

  let workouts = liveQuery(() => db.workouts.toArray());
  let workoutExercises = liveQuery(() => db.workoutExercises.toArray());

  $effect(() => {
    showIllustration = $workouts?.length === 0;
  });

  const createWorkout = async (name: string) => {
    if (!name) return;
    db.workouts.add({ name }).then((newId) => {
      goto(`/${newId}/exercises?complete=true`);
    });
  };

  function getWorkoutExercises(workoutId: number) {
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
  <section>
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
  {#if showIllustration}
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
  title="Create a workout"
  onSubmit={createWorkout}
  submitText="Create"
  placeholder="e.g. Upper Body"
  bind:open={showModal}
/>

<style>
  section {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    overflow: scroll;
  }
</style>
