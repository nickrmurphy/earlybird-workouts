<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    ArrowUpDown,
    Clock,
    Delete,
    PencilEdit,
    PlusMinusCircle,
  } from "$lib/icons";
  import { deleteWorkout, startWorkout } from "$lib/mutations";
  import { goto } from "$app/navigation";
  import {
    Navbar,
    PageHeader,
    Heading,
    NavbarActionItem,
    Button,
    ExerciseList,
    EmptyMessage,
  } from "$lib/components";
  import Plus from "$lib/icons/Plus.svelte";

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
      <Button
        id="edit-workout"
        variant="ghost"
        rounded="full"
        onclick={() => goto(`/${data.workout.id}/exercises`)}
      >
        {#if data.exercises.length > 0}
          <PlusMinusCircle />
        {:else}
          <Plus />
        {/if}
      </Button>
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
    <NavbarActionItem href={`/${data.workout.id}/reorder`}>
      Reorder exercises
      <ArrowUpDown />
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
    onclick={() => startWorkout(data.workout.id)}
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
