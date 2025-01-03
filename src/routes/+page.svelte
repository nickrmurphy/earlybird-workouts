<script lang="ts">
  import { goto } from "$app/navigation";
  import Button from "../Button.svelte";
  import Heading from "../Heading.svelte";
  import { Plus } from "../icons";
  import PageNavHeader from "../PageNavHeader.svelte";
  import WorkoutCard from "../WorkoutCard.svelte";

  const { data } = $props();

  function getExercises(workoutId: number) {
    const exercises = data.exercises?.[workoutId] || [];
    return exercises.map((exercise) => exercise.name);
  }
</script>

<PageNavHeader title="Workouts">
  {#snippet headerContent()}
    <Button rounded="full" onclick={() => goto("/new")}>
      <Plus />
    </Button>
  {/snippet}
</PageNavHeader>
<main>
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
