<script lang="ts">
  import {
    Button,
    Navbar,
    Page,
    PageHeader,
    NavbarButton,
  } from "$lib/components";
  import { page } from "$app/state";
  import { flip } from "svelte/animate";
  import {
    IconCheck,
    IconChevronDown,
    IconChevronUp,
  } from "@tabler/icons-svelte";
  import { arraymove } from "$lib/utils";
  import { updateWorkoutExercisesOrder } from "$lib/resources/workoutExercises.js";

  const { data } = $props();

  let orderedExercises = $state(data.workoutExercises);

  let changed = $derived.by(() => {
    return (
      JSON.stringify(data.workoutExercises) !== JSON.stringify(orderedExercises)
    );
  });

  async function saveChanges() {
    if (!changed) return;
    await updateWorkoutExercisesOrder(orderedExercises.map((e) => e.id));
  }
</script>

<Page>
  <PageHeader title={data.workout.name} />
  <ol class="divide-divide divide-y">
    {#each orderedExercises as exercise, idx (exercise.id)}
      <li
        animate:flip={{ duration: 300 }}
        class="flex items-center justify-between px-4 py-5 font-bold"
      >
        {exercise.exerciseName}
        <div class="flex gap-3">
          <Button
            disabled={idx === 0}
            variant="outline"
            type="button"
            onclick={() => arraymove(orderedExercises, idx, idx - 1)}
          >
            <IconChevronUp />
          </Button>
          <Button
            variant="outline"
            disabled={idx === data.workoutExercises.length - 1}
            type="button"
            onclick={() => arraymove(orderedExercises, idx, idx + 1)}
          >
            <IconChevronDown />
          </Button>
        </div>
      </li>
    {/each}
  </ol>
  <Navbar backHref="/{page.params.workoutId}">
    <NavbarButton class="w-full" disabled={!changed} onclick={saveChanges}>
      Save changes <IconCheck />
    </NavbarButton>
  </Navbar>
</Page>
