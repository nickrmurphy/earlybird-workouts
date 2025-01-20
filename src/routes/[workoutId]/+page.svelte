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
    IconPlus,
    IconPlusMinus,
    IconSwitchVertical,
  } from "@tabler/icons-svelte";
  import { fade } from "svelte/transition";

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

<PageHeader title={data.workout.name} />
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
  {#snippet actions()}
    <NavbarActionItem href={`/${data.workout.id}/edit`}>
      Rename workout
      <PencilEdit />
    </NavbarActionItem>
    <NavbarActionItem href={`/${data.workout.id}/history`}>
      View history
      <Clock />
    </NavbarActionItem>
    <NavbarActionItem onclick={confirmDelete} variant="destructive">
      Delete workout
      <Delete />
    </NavbarActionItem>
  {/snippet}
  <Button
    disabled={data.exercises.length === 0}
    --width="100%"
    class="btn"
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
</style>
