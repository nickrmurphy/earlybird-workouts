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
  } from "$lib/components";
  import { IconCirclePlus } from "@tabler/icons-svelte";
  import { createWorkout } from "$lib/mutations";
  import { onMount } from "svelte";

  const { data } = $props();

  let showIllustration = $state(false);
  let showModal = $state(false);

  const handleCreateWorkout = async (name: string) => {
    if (!name) return;
    const newId = await createWorkout(name);
    if (newId) {
      goto(`/${newId}/exercises?complete=true`);
    }
  };

  onMount(() => {
    showIllustration = data.workouts.length === 0;
  });
</script>

<Page>
  <PageHeader title="Workouts">
    {#snippet right()}
      <button onclick={() => (showModal = true)}>
        <IconCirclePlus color="var(--primary)" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  <section>
    {#if data.workouts.length > 0}
      {#each data.workouts as workout}
        <Pressable href={`/${workout.id}`}>
          <WorkoutCard
            workoutId={workout.id}
            workoutName={workout.name}
            exercises={workout.exercises.map((e) => e.name)}
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
</Page>
<InputDialog
  title="Create a workout"
  onSubmit={handleCreateWorkout}
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
