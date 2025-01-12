<script lang="ts">
  import { goto } from "$app/navigation";
  import { Plus } from "$lib/icons";
  import {
    PageHeader,
    Button,
    WorkoutCard,
    EmptyMessage,
  } from "$lib/components";

  const { data } = $props();

  function getExercises(workoutId: number) {
    const exercises = data.workoutExercises[workoutId] || [];
    return exercises.map((exercise) => exercise.name);
  }
</script>

<PageHeader title="Workouts">
  <Button rounded="full" onclick={() => goto("/new")}>
    <Plus />
  </Button>
</PageHeader>
<main>
  <section class="workouts">
    {#if data.workouts.length > 0}
      {#each data.workouts as workout}
        <a href={`/${workout.id}`}>
          <WorkoutCard
            workoutName={workout.name}
            exercises={getExercises(workout.id)}
          />
        </a>
      {/each}
    {:else}
      <EmptyMessage
        header="No Workouts yet."
        message="Click the plus button to add one."
      />
    {/if}
  </section>
</main>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-5);
    padding: var(--size-4) var(--size-2);
  }

  section.workouts {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    overflow: scroll;
  }
</style>
