<script lang="ts">
  import { goto } from "$app/navigation";
  import Button from "../Button.svelte";
  import Heading from "../Heading.svelte";
  import { Plus } from "../icons";
  import WorkoutCard from "../WorkoutCard.svelte";

  const { data } = $props();

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
    <Button rounded="full" onclick={() => goto("/new")}>
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

</style>
