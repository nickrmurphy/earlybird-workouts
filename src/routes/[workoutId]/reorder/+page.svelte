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
  import { liveQuery } from "dexie";
  import { db } from "$lib/db";
  import { arraymove } from "$lib/utils";

  const workout = liveQuery(() => db.workouts.get(page.params.workoutId));

  const workoutExercises = liveQuery(() =>
    db.workoutExercises
      .where("workoutId")
      .equals(page.params.workoutId)
      .sortBy("order"),
  );

  let orderedExercises = $state(
    $workoutExercises ? [...$workoutExercises] : [],
  );

  let changed = $derived.by(() => {
    if (!$workoutExercises) return false;
    return (
      JSON.stringify($workoutExercises) !== JSON.stringify(orderedExercises)
    );
  });

  $effect(() => {
    orderedExercises = $workoutExercises ? [...$workoutExercises] : [];
  });

  async function saveChanges() {
    if (!changed) return;

    await db.transaction("rw", [db.workoutExercises], async (tx) => {
      for (let i = 0; i < orderedExercises.length; i++) {
        await tx.workoutExercises.update(orderedExercises[i].id, {
          order: i + 1,
        });
      }
    });
  }
</script>

<Page>
  <PageHeader title={$workout?.name} />
  <ol class="divide-divide divide-y">
    {#each orderedExercises as exercise, idx (exercise.id)}
      <li
        animate:flip={{ duration: 300 }}
        class="flex items-center justify-between px-4 py-5 font-bold"
      >
        {exercise.name}
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
            disabled={idx === $workoutExercises?.length - 1}
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
