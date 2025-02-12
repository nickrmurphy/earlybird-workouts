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
    DropdownItem,
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
  import { db, createWorkoutHistoryAndExerciseSets } from "$lib/db";
  import { liveQuery } from "dexie";
  import { page } from "$app/state";
  import { globalState } from "$lib/state";
  let { data } = $props();
  let dropdownToggle: HTMLElement | null = $state(null);
  let showEditDialog = $state(false);
  let showExerciseDialog = $state(false);

  let workout = liveQuery(() => db.workouts.get(page.params.workoutId));

  let workoutExercises = liveQuery(() =>
    db.workoutExercises
      .where("workoutId")
      .equals(page.params.workoutId)
      .toArray(),
  );

  let selectedExerciseId = $state<string | null>(null);
  let selectedExercise = $derived.by(() => {
    if (!selectedExerciseId || !$workoutExercises) return null;
    return $workoutExercises.find(
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
      db.workouts.delete(page.params.workoutId);
      goto("/");
    }
  }

  async function startWorkout() {
    await createWorkoutHistoryAndExerciseSets(page.params.workoutId).then(
      (historyId) => {
        globalState.activity.currentId = historyId;
        goto(`/active/${historyId}`);
      },
    );
  }
</script>

<Page>
  {#if $workout}
    <PageHeader
      title={$workout.name}
      viewTransitionName="workout-header-{$workout.id}"
    >
      {#snippet right()}
        <button
          class="disabled:opacity-50"
          onclick={() => goto(`/${page.params.workoutId}/reorder`)}
          disabled={$workoutExercises?.length === 0}
        >
          <IconSwitchVertical class="text-accent" />
        </button>
        <button onclick={() => goto(`/${page.params.workoutId}/exercises`)}>
          {#if $workoutExercises?.length > 0}
            <IconPlusMinus class="text-accent" />
          {:else}
            <IconPlus class="text-accent" />
          {/if}
        </button>
        <button bind:this={dropdownToggle}>
          <IconDotsCircleHorizontal class="text-accent" />
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
  {/if}
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
            weightUnit={exercise.weightUnit}
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
    onWeightUnitChange={(unit) => {
      db.workoutExercises.update(selectedExercise.id, { weightUnit: unit });
    }}
    defaultWeight={selectedExercise.weight}
    defaultWeightUnit={selectedExercise.weightUnit}
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
    db.workouts.update(page.params.workoutId, { name });
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
