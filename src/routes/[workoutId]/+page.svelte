<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import { Clock, Delete, PencilEdit } from "$lib/icons";
  import { deleteWorkout, startWorkout } from "$lib/mutations";
  import { goto } from "$app/navigation";
  import { impactFeedback } from "@tauri-apps/plugin-haptics";
  import {
    Navbar,
    PageHeader,
    Heading,
    NavbarActionItem,
    Button,
    ExerciseList,
    EmptyMessage,
  } from "$lib/components";
  import {
    IconDotsCircleHorizontal,
    IconHistory,
    IconPencil,
    IconPlus,
    IconPlusMinus,
    IconSwitchVertical,
    IconTrashFilled,
  } from "@tabler/icons-svelte";
  import { popover } from "$lib/actions/index.js";
  import { fade } from "svelte/transition";

  let dropdownToggle: HTMLElement | null = $state(null);
  let showDropdown = $state(false);

  let { data } = $props();

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

<PageHeader title={data.workout.name} level={2}>
  <button
    bind:this={dropdownToggle}
    onclick={() => (showDropdown = !showDropdown)}
  >
    <IconDotsCircleHorizontal />
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
</PageHeader>
<main>
  <section>
    <header>
      <label for="edit-workout">
        <Heading level={2}>Exercises</Heading>
      </label>
      <div style="display: flex; gap: var(--size-1)">
        <Button
          variant="ghost"
          rounded="full"
          onclick={() => goto(`/${data.workout.id}/reorder`)}
        >
          <IconSwitchVertical />
        </Button>
        <Button
          id="edit-workout"
          variant="ghost"
          rounded="full"
          onclick={() => goto(`/${data.workout.id}/exercises`)}
        >
          {#if data.exercises.length > 0}
            <IconPlusMinus />
          {:else}
            <IconPlus />
          {/if}
        </Button>
      </div>
    </header>
    {#if data.exercises.length > 0}
      <ExerciseList workoutId={data.workout.id} exercises={data.exercises} />
    {:else}
      <EmptyMessage
        header="No exercises yet."
        message="Click the plus button to add one."
      />
    {/if}
  </section>
</main>
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
  </Button>
</Navbar>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    padding: var(--size-2);

    padding-bottom: var(--navbar-height);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
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
</style>
