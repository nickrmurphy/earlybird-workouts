<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    deleteWorkout,
    renameWorkout,
    startWorkout,
    updateReps,
    updateSets,
    updateWeight,
  } from "$lib/mutations";
  import { goto } from "$app/navigation";
  import { impactFeedback } from "@tauri-apps/plugin-haptics";
  import {
    Navbar,
    Button,
    EmptyMessage,
    Page,
    ExerciseItem,
    PageHeader,
    InputDialog,
    Dropdown,
    ExerciseDrawer,
  } from "$lib/components";
  import {
    IconDotsCircleHorizontal,
    IconHistory,
    IconPencil,
    IconPlus,
    IconPlusMinus,
    IconRocket,
    IconSwitchVertical,
    IconTrashFilled,
  } from "@tabler/icons-svelte";
  import { NavigationMonitor } from "$lib/assets";
  import DropdownItem from "$lib/components/ui/Dropdown/DropdownItem.svelte";
  let { data } = $props();
  let dropdownToggle: HTMLElement | null = $state(null);
  let showEditDialog = $state(false);
  let showExerciseDialog = $state(false);

  let selectedExercise = $derived(data.exercise);

  $effect(() => {
    if (selectedExercise) {
      showExerciseDialog = true;
    }
  });

  async function confirmDelete() {
    const confirmDelete = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "Delete workout", kind: "warning", okLabel: "Delete" },
    );

    if (confirmDelete) {
      await deleteWorkout(data.workout.id).then(() => {
        goto("/");
      });
    }
  }
</script>

<Page>
  <PageHeader
    title={data.workout.name}
    viewTransitionName="workout-header-{data.workout.id}"
  >
    {#snippet right()}
      <button
        onclick={() => goto(`/${data.workout.id}/reorder`)}
        disabled={data.exercises.length === 0}
      >
        <IconSwitchVertical
          size={24}
          color="var(--primary)"
          style={data.exercises.length === 0 ? "opacity: 50%;" : ""}
        />
      </button>
      <button onclick={() => goto(`/${data.workout.id}/exercises`)}>
        {#if data.exercises.length > 0}
          <IconPlusMinus size={24} color="var(--primary)" />
        {:else}
          <IconPlus size={24} color="var(--primary)" />
        {/if}
      </button>
      <button bind:this={dropdownToggle}>
        <IconDotsCircleHorizontal size={24} color="var(--primary)" />
      </button>
      <Dropdown anchor={dropdownToggle}>
        <DropdownItem onclick={() => (showEditDialog = true)}>
          Rename <IconPencil />
        </DropdownItem>
        <DropdownItem onclick={() => goto(`/${data.workout.id}/history`)}>
          View history
          <IconHistory />
        </DropdownItem>
        <DropdownItem onclick={confirmDelete} style="color: var(--destructive)">
          Delete <IconTrashFilled />
        </DropdownItem>
      </Dropdown>
    {/snippet}
  </PageHeader>
  <section>
    {#if data.exercises.length > 0}
      {#each data.exercises as exercise}
        <ExerciseItem
          onclick={() => goto(`?exerciseId=${exercise.id}`)}
          name={exercise.name}
          sets={exercise.sets}
          reps={exercise.reps}
          weight={exercise.weight}
        />
      {/each}
    {:else}
      <EmptyMessage
        header="No exercises yet."
        message="Tap the plus button to add an exercise."
      />
      <NavigationMonitor />
    {/if}
  </section>
</Page>
{#if selectedExercise}
  <ExerciseDrawer
    bind:open={showExerciseDialog}
    name={selectedExercise.name}
    onWeightChange={(weight) => {
      updateWeight(data.workoutId, selectedExercise.id, weight);
    }}
    onSetsChange={(sets) => {
      updateSets(data.workoutId, selectedExercise.id, sets);
    }}
    onRepsChange={(reps) => {
      updateReps(data.workoutId, selectedExercise.id, reps);
    }}
    defaultWeight={selectedExercise.weight}
    defaultSets={selectedExercise.sets}
    defaultReps={selectedExercise.reps}
    instructions={data.instructions}
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
  onSubmit={async (name) => {
    if (!name) return;
    await renameWorkout(data.workout.id, name);
  }}
  submitText="Save"
/>

<Navbar backHref="/">
  <Button
    disabled={data.exercises.length === 0}
    --width="100%"
    rounded="full"
    onclick={async () => {
      await impactFeedback("medium");
      startWorkout(data.workout.id);
    }}
  >
    Start workout
    <IconRocket />
  </Button>
</Navbar>

<style>
  button {
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>
