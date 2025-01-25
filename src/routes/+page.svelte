<script lang="ts">
  import { goto } from "$app/navigation";
  import { SportsJogging } from "$lib/assets";

  import {
    WorkoutCard,
    EmptyMessage,
    Pressable,
    Page,
    Input,
    PageHeader,
  } from "$lib/components";
  import Button from "$lib/components/ui/Button.svelte";
  import { createWorkout } from "$lib/mutations";

  import { IconArrowRight, IconCirclePlus } from "@tabler/icons-svelte";
  import { onMount } from "svelte";

  let showIllustration = $state(false);
  let newWorkoutName = $state("");
  let createWorkoutModal: HTMLDialogElement | null = $state(null);

  const { data } = $props();

  function getExercises(workoutId: string) {
    const exercises = data.workoutExercises[workoutId] || [];
    return exercises.map((exercise) => exercise.name);
  }

  const handleCreateWorkout = async (e: Event) => {
    e.preventDefault();
    if (!newWorkoutName) return;
    const newId = await createWorkout(newWorkoutName);
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
      <button onclick={() => createWorkoutModal?.showModal()}>
        <IconCirclePlus color="var(--primary)" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  <section class="workouts">
    {#if data.workouts.length > 0}
      {#each data.workouts as workout}
        <Pressable href={`/${workout.id}`}>
          <WorkoutCard
            workoutName={workout.name}
            exercises={getExercises(workout.id)}
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

<dialog bind:this={createWorkoutModal}>
  <h1>Create a workout</h1>
  <form
    style="display: flex; gap: var(--size-4); flex-direction: column;"
    onsubmit={handleCreateWorkout}
  >
    <Input
      bind:value={newWorkoutName}
      minlength={1}
      min={1}
      placeholder="e.g. Upper Body"
      type="text"
      enterkeyhint="next"
    />
    <div style="display: flex; flex-direction: column; gap: var(--size-3);">
      <Button type="submit">
        Create
        <IconArrowRight />
      </Button>
      <Button
        type="button"
        variant="ghost"
        onclick={() => createWorkoutModal?.close()}>Cancel</Button
      >
    </div>
  </form>
</dialog>

<style>
  section.workouts {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    overflow: scroll;
  }

  dialog[open] {
    display: flex;
    position: fixed;
    flex-direction: column;
    gap: var(--size-4);
    margin-top: 33%;
    margin-right: auto;
    margin-bottom: auto;
    margin-left: auto;
    border: none;
    border-radius: var(--radius-3);
    background-color: var(--popover);
    width: 90%;
    color: var(--foreground);
  }

  dialog::backdrop {
    backdrop-filter: blur(0px);
    background-color: hsl(var(--black-hsl) / 60%);
  }

  dialog h1 {
    font-weight: 600;
    font-size: var(--size-4);
  }
</style>
