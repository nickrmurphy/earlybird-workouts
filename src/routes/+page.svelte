<script lang="ts">
  import { goto } from "$app/navigation";
  import { Plus } from "$lib/icons";
  import {
    PageHeader,
    Button,
    WorkoutCard,
    EmptyMessage,
    Pressable,
    Page,
  } from "$lib/components";
  import PageHeader2 from "$lib/components/page/PageHeader2.svelte";
  import Button2 from "$lib/components/ui/Button2.svelte";
  import { IconCirclePlus, IconCirclePlusFilled } from "@tabler/icons-svelte";

  const { data } = $props();

  function getExercises(workoutId: number) {
    const exercises = data.workoutExercises[workoutId] || [];
    return exercises.map((exercise) => exercise.name);
  }
</script>

<!-- <PageHeader title="Workouts">
  
</PageHeader> -->
<Page>
  <PageHeader2 title="Workouts">
    {#snippet right()}
      <button onclick={() => goto("/new")}>
        <IconCirclePlus color="var(--primary)" size={24} />
      </button>
    {/snippet}
  </PageHeader2>
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
        header="No Workouts yet."
        message="Click the plus button to add one."
      />
    {/if}
  </section>
</Page>

<style>
  section.workouts {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    overflow: scroll;
  }
</style>
