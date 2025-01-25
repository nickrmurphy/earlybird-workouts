<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    deleteWorkout,
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
  import { popover } from "$lib/actions/index.js";
  import { fade } from "svelte/transition";
  import Input from "$lib/components/ui/Input.svelte";
  import { debounce } from "$lib/utils.js";
  import { NavigationMonitor } from "$lib/assets";
  let { data } = $props();
  let dropdownToggle: HTMLElement | null = $state(null);
  let showDropdown = $state(false);
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
      <button
        bind:this={dropdownToggle}
        onclick={() => (showDropdown = !showDropdown)}
      >
        <IconDotsCircleHorizontal size={24} color="var(--primary)" />
      </button>
      {#if showDropdown}
        <div
          class="dropdown"
          transition:fade={{ duration: 100 }}
          use:popover={{
            anchorElement: dropdownToggle,
            onClickOutside: () => (showDropdown = false),
          }}
        >
          <button onclick={() => goto(`/${data.workout.id}/edit`)}>
            Rename <IconPencil />
          </button>
          <button onclick={() => goto(`/${data.workout.id}/history`)}>
            View history
            <IconHistory />
          </button>
          <button onclick={confirmDelete} style="color: var(--destructive)">
            Delete <IconTrashFilled />
          </button>
        </div>
      {/if}
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
<Drawer bind:open={showExerciseDialog} title={exercise?.name}>
  <div style="display: flex; gap: var(--size-4); flex-direction: column;">
    <label>
      <span>Weight (lbs)</span>
      <Input
        defaultValue={data.exercise?.weight}
        type="number"
        step={0.5}
        inputmode="decimal"
        oninput={(e) => debouncedUpdateWeight(parseInt(e.currentTarget.value))}
      />
    </label>
    <label>
      <span>Sets</span>
      <select
        value={data.exercise?.sets}
        onchange={(e) => debouncedUpdateSets(parseInt(e.currentTarget.value))}
      >
        {#each { length: 10 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </select>
    </label>
    <label>
      <span>Reps</span>
      <select
        value={data.exercise?.reps}
        onchange={(e) => debouncedUpdateReps(parseInt(e.currentTarget.value))}
      >
        {#each { length: 30 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </select>
    </label>
  </div>
  {#if data.instructions}
    <details style="display: flex; flex-direction: column; gap: var(--size-2);">
      <summary style="color: var(--muted-foreground)">View instructions</summary
      >
      <ol
        style="margin-top: var(--size-4); line-height: var(--font-lineheight-3); color: var(--muted-foreground);"
      >
        {#each data.instructions as instruction, idx}
          <li>
            <span>{idx + 1}.</span>
            {instruction.instruction}
          </li>
        {/each}
      </ol>
    </details>
  {/if}
</Drawer>

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

  div.dropdown {
    display: flex;
    position: absolute;
    flex-direction: column;
    border-radius: var(--radius-3);
    background-color: var(--licorice);

    button {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: var(--size-2);
      box-shadow: var(--shadow-5);
      padding: var(--size-2) var(--size-3);
      width: 100%;
      min-width: 200px;
    }
  }

  label {
    display: grid;
    gap: var(--size-2);
  }

  select {
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    background-color: transparent;
    padding: 12px 10px;
    color: var(--magnolia);
    font-weight: var(--font-weight);
    font-size: var(--font-size, var(--font-size-2));
  }

  select:focus {
    transition: all;
    outline: 2px solid var(--primary-color);
    outline-offset: 2px;
  }

  ol {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    padding: var(--size-2);

    li {
      font-size: var(--font-size-2);
      line-height: var(--font-lineheight-4);
      span {
        font-weight: var(--font-weight-7);
      }
    }
  }
</style>
