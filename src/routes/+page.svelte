<script lang="ts">
  import { goto } from "$app/navigation";
  import Button from "../Button.svelte";
  import Dialog from "../Dialog.svelte";
  import Heading from "../Heading.svelte";
  import { Plus } from "../icons";
  import Input from "../Input.svelte";
  import WorkoutCard from "../WorkoutCard.svelte";
  import { createWorkout } from "./actions";

  const { data } = $props();

  let newWorkoutName = $state("");

  function getExercises(workoutId: number) {
    const exercises = data.exercises?.[workoutId] || [];
    return exercises.map((exercise) => exercise.name);
  }
</script>

<main>
  <header>
    <Heading>
      Workouts
    </Heading>
    <Button rounded="full" popovertarget="create-workout">
      <Plus />
    </Button>
</header>
  <section class="workouts">
    {#if data.workouts}
      {#each data.workouts as workout}
        <a href={`/${workout.id}`}>
          <WorkoutCard
            workoutName={workout.name}
            exercises={getExercises(workout.id)}
          />
        </a>
      {/each}
    {/if}
  </section>
</main>

<Dialog id="create-workout" popover="auto" ontoggle={(e) => {
  if (e.newState === "closed") {
    newWorkoutName = "";
  }
}}>
  <h2>Workout name</h2>
  <form id="create-workout-form" onsubmit={async (e) => {
    e.preventDefault();
    const newId = await createWorkout(newWorkoutName);
    if (newId) {
      newWorkoutName = "";
      goto(`/${newId}`);
    }
  }}>
    <Input bind:value={newWorkoutName} placeholder="e.g. Upper body" required minlength={2} />
  </form>
  {#snippet actions()}
    <Button variant="ghost" popovertargetaction="hide" popovertarget="create-workout">Cancel</Button>
    <Button type="submit" form="create-workout-form">Save</Button>
  {/snippet}
</Dialog>

<style>
  header, main {
    padding: var(--size-1) var(--size-2);
  }

  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-5);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  section.workouts {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    overflow: scroll;
  }

  h2 {
    font-size: var(--size-4);
    font-weight: var(--font-weight-5);
  }
</style>
