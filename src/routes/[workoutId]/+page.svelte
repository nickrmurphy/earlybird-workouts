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
    Drawer,
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
  import { debounce } from "$lib/utils.js";
  import { NavigationMonitor } from "$lib/assets";
  import DropdownItem from "$lib/components/ui/Dropdown/DropdownItem.svelte";
  let { data } = $props();
  let dropdownToggle: HTMLElement | null = $state(null);
  let showEditDialog = $state(false);
  let showExerciseDialog = $state(false);

  const debouncedUpdateWeight = debounce((weight: number) => {
    if (!data.exercise) return;
    updateWeight(data.workoutId, data.exercise.id, weight);
  }, 500);

  const debouncedUpdateSets = debounce((sets: number) => {
    if (!data.exercise) return;
    updateSets(data.workoutId, data.exercise.id, sets);
  }, 500);

  const debouncedUpdateReps = debounce((reps: number) => {
    if (!data.exercise) return;
    updateReps(data.workoutId, data.exercise.id, reps);
  }, 500);

  let exercise = $derived(data.exercise);

  $effect(() => {
    if (exercise) {
      showExerciseDialog = true;
    }
  });

  $effect(() => {
    if (!showExerciseDialog) {
      goto(`?`);
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
  <PageHeader title={data.workout.name}>
    {#snippet right()}
      <button
        onclick={() => goto(`/${data.workout.id}/reorder`)}
        disabled={data.exercises.length === 0}
      >
        <IconSwitchVertical
          color="var(--primary)"
          style={data.exercises.length === 0 ? "opacity: 50%;" : ""}
        />
      </button>
      <button onclick={() => goto(`/${data.workout.id}/exercises`)}>
        {#if data.exercises.length > 0}
          <IconPlusMinus color="var(--primary)" />
        {:else}
          <IconPlus color="var(--primary)" />
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
{#if data.exercise}
  <ExerciseDrawer
    bind:open={showExerciseDialog}
    name={data.exercise.name}
    onWeightChange={debouncedUpdateWeight}
    onSetsChange={debouncedUpdateSets}
    onRepsChange={debouncedUpdateReps}
    defaultWeight={data.exercise.weight}
    defaultSets={data.exercise.sets}
    defaultReps={data.exercise.reps}
    instructions={data.instructions?.map((i) => i.instruction)}
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
    width: 40px;
    height: 40px;
  }
</style>
