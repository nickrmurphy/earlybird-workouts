<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import { goto } from "$app/navigation";
  import {
    Navbar,
    EmptyMessage,
    Page,
    ExerciseItem,
    PageHeader,
    InputDialog,
    Dropdown,
    ExerciseDrawer,
    NavbarButton,
  } from "$lib/components";
  import {
    IconDotsCircleHorizontal,
    IconPencil,
    IconPlus,
    IconPlusMinus,
    IconReportAnalytics,
    IconRocket,
    IconSwitchVertical,
    IconTrash,
  } from "@tabler/icons-svelte";
  import { NavigationMonitor } from "$lib/assets";
  import DropdownItem from "$lib/components/ui/Dropdown/DropdownItem.svelte";
  import { db } from "$lib/db/index.js";
  import { liveQuery } from "dexie";
  import { page } from "$app/state";
  let { data } = $props();
  let dropdownToggle: HTMLElement | null = $state(null);
  let showEditDialog = $state(false);
  let showExerciseDialog = $state(false);

  let workout = liveQuery(() =>
    db.workouts.where("id").equals(parseInt(page.params.workoutId)).first(),
  );

  let workoutExercises = liveQuery(() =>
    db.workoutExercises
      .where("workoutId")
      .equals(parseInt(page.params.workoutId))
      .toArray(),
  );

  let selectedExerciseId = $state<string | null>(null);
  let selectedExercise = $derived.by(() => {
    if (!selectedExerciseId) return null;
    return $workoutExercises?.find(
      (exercise) => exercise.exerciseId === selectedExerciseId,
    );
  });

  $effect(() => {
    if (selectedExercise) {
      showExerciseDialog = true;
    }
  });

  $effect(() => {
    if (!showExerciseDialog) {
      selectedExerciseId = null;
    }
  });

  async function confirmDelete() {
    const confirmDelete = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "Delete workout", kind: "warning", okLabel: "Delete" },
    );

    if (confirmDelete) {
      db.workouts.delete(parseInt(page.params.workoutId));
      goto("/");
    }
  }

  async function startWorkout() {
    await db
      .transaction(
        "rw",
        [
          db.workoutExercises,
          db.workouts,
          db.history,
          db.historyExercises,
          db.historySets,
        ],
        async (tx) => {
          const workout = await tx.workouts.get(
            parseInt(page.params.workoutId),
          );
          if (!workout) throw new Error("Workout not found");

          const exercises = await tx.workoutExercises
            .where("workoutId")
            .equals(workout.id)
            .sortBy("order");

          const historyId = await tx.history.add({
            workoutId: workout.id,
            startTime: new Date(),
            workoutName: workout.name,
          });

          for (const exercise of exercises) {
            const historyExerciseId = await tx.historyExercises.add({
              historyId,
              exerciseId: exercise.exerciseId,
              exerciseName: exercise.name,
            });

            await tx.historySets.bulkAdd(
              Array.from({ length: exercise.sets }, () => ({
                historyId,
                historyExerciseId,
                weight: exercise.weight,
                count: exercise.count,
                exerciseId: exercise.exerciseId,
                isSuccess: false,
              })),
            );
          }

          return historyId;
        },
      )
      .then((historyId) => {
        localStorage.setItem("activeHistoryId", historyId.toString());
        goto(`/active/${historyId}`);
      });
  }
</script>

{#if $workout}
  <Page>
    <PageHeader
      title={$workout.name}
      viewTransitionName="workout-header-{$workout.id}"
    >
      {#snippet right()}
        <button
          class="disabled:opacity-50"
          onclick={() => goto(`/${$workout.id}/reorder`)}
          disabled={$workoutExercises?.length === 0}
        >
          <IconSwitchVertical color="var(--color-accent)" />
        </button>
        <button onclick={() => goto(`/${$workout.id}/exercises`)}>
          {#if $workoutExercises?.length > 0}
            <IconPlusMinus color="var(--color-accent)" />
          {:else}
            <IconPlus color="var(--color-accent)" />
          {/if}
        </button>
        <button bind:this={dropdownToggle}>
          <IconDotsCircleHorizontal color="var(--color-accent)" />
        </button>
        <Dropdown anchor={dropdownToggle}>
          <DropdownItem onclick={() => (showEditDialog = true)}>
            Rename <IconPencil />
          </DropdownItem>
          <DropdownItem onclick={confirmDelete}>
            Delete <IconTrash color="var(--color-red-500)" />
          </DropdownItem>
        </Dropdown>
      {/snippet}
    </PageHeader>
    {#if $workoutExercises}
      <section class="flex flex-col gap-5">
        {#if $workoutExercises.length === 0}
          <EmptyMessage
            header="No exercises yet."
            message="Tap the plus button to add an exercise."
          />
          <NavigationMonitor />
        {:else}
          {#each $workoutExercises as exercise}
            <ExerciseItem
              onclick={() => {
                selectedExerciseId = exercise.exerciseId;
              }}
              name={exercise.name}
              sets={exercise.sets}
              reps={exercise.count}
              weight={exercise.weight}
            />
          {/each}
        {/if}
      </section>
    {/if}
  </Page>
{/if}

{#if selectedExercise}
  <ExerciseDrawer
    bind:open={showExerciseDialog}
    name={selectedExercise.name}
    onWeightChange={(weight) => {
      db.workoutExercises.update(selectedExercise.id, { weight });
    }}
    onSetsChange={(sets) => {
      db.workoutExercises.update(selectedExercise.id, { sets });
    }}
    onRepsChange={(reps) => {
      db.workoutExercises.update(selectedExercise.id, { count: reps });
    }}
    defaultWeight={selectedExercise.weight}
    defaultSets={selectedExercise.sets}
    defaultReps={selectedExercise.count}
    instructions={data.allExercises.find(
      (exercise) => exercise.id === selectedExercise?.exerciseId,
    )?.instructions}
    onOpenChange={(open) => {
      if (!open) {
        goto(`?`);
      }
    }}
  />
{/if}
<InputDialog
  bind:open={showEditDialog}
  title="Rename exercise"
  defaultValue={$workout?.name}
  onSubmit={async (name) => {
    if (!name) return;
    db.workouts.update(parseInt(page.params.workoutId), { name });
  }}
  submitText="Save"
/>

<Navbar backHref="/">
  <NavbarButton class="w-full" onclick={async () => await startWorkout()}>
    Start workout
    <IconRocket />
  </NavbarButton>
  <NavbarButton
    variant="secondary"
    onclick={() => goto(`/${page.params.workoutId}/history`)}
  >
    <IconReportAnalytics />
  </NavbarButton>
</Navbar>
