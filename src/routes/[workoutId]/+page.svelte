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
  import { page } from "$app/state";
  import { globalState } from "$lib/state";
  import { deleteWorkout, updateWorkout } from "$lib/resources/workouts.js";
  import {
    createActivityAndSets,
    updateWorkoutExercise,
  } from "$lib/resources/index.js";

  let { data } = $props();

  let dropdownToggle: HTMLElement | null = $state(null);
  let showEditDialog = $state(false);
  let showExerciseDialog = $state(false);

  let selectedExerciseId = $state<string | null>(null);
  let selectedExercise = $derived.by(() => {
    if (!selectedExerciseId || !data.workoutExercises) return null;
    return data.workoutExercises.find(
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
      deleteWorkout(page.params.workoutId).then(() => {
        goto("/");
      });
    }
  }

  async function updateName(name: string) {
    if (!name) return;
    updateWorkout(page.params.workoutId, { name }).then(() => {
      showEditDialog = false;
    });
  }

  async function startWorkout() {
    await createActivityAndSets({ workoutId: page.params.workoutId }).then(
      (historyId) => {
        globalState.activity.currentId = historyId;
        goto(`/activity/${historyId}`);
      },
    );
  }
</script>

<Page>
  <PageHeader
    title={data.workout.name}
    viewTransitionName="workout-header-{data.workout.id}"
  >
    {#snippet right()}
      <button
        class="disabled:opacity-50"
        onclick={() => goto(`/${page.params.workoutId}/reorder`)}
        disabled={data.workoutExercises.length === 0}
      >
        <IconSwitchVertical class="text-accent" />
      </button>
      <button onclick={() => goto(`/${page.params.workoutId}/exercises`)}>
        {#if data.workoutExercises.length > 0}
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
  <section class="flex flex-col gap-5">
    {#if data.workoutExercises.length === 0}
      <EmptyMessage
        header="No exercises yet."
        message="Tap the plus button to add an exercise."
      />
      <NavigationMonitor />
    {:else}
      {#each data.workoutExercises as exercise (exercise.id)}
        <ExerciseItem
          onclick={() => {
            selectedExerciseId = exercise.exerciseId;
          }}
          weightUnit={exercise.weightUnit}
          name={exercise.exerciseName}
          sets={exercise.sets}
          reps={exercise.count}
          weight={exercise.weight}
        />
      {/each}
    {/if}
  </section>
</Page>

{#if selectedExercise}
  <ExerciseDrawer
    bind:open={showExerciseDialog}
    name={selectedExercise.exerciseName}
    onWeightChange={(weight) => {
      updateWorkoutExercise(selectedExercise.id, { weight });
    }}
    onSetsChange={(sets) => {
      updateWorkoutExercise(selectedExercise.id, { sets });
    }}
    onRepsChange={(reps) => {
      updateWorkoutExercise(selectedExercise.id, { count: reps });
    }}
    onWeightUnitChange={(unit) => {
      updateWorkoutExercise(selectedExercise.id, {
        weightUnit: unit,
      });
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
  defaultValue={data.workout.name}
  onSubmit={(name) => updateName(name)}
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
