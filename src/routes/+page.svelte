<script lang="ts">
  import { goto } from "$app/navigation";
  import Button from "../Button.svelte";
  import { Plus } from "../icons";
  import { PageHeader } from "$lib/components/page";
  import WorkoutCard from "../WorkoutCard.svelte";

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
