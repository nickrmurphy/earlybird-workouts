<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import { PlusMinusCircle } from "$lib/icons";
  import { deleteWorkout, startWorkout } from "$lib/workoutActions";
  import { goto } from "$app/navigation";
  import {
    Navbar,
    PageHeader,
    Heading,
    NavbarActionItem,
    Button,
    ExerciseList,
  } from "$lib/components";

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
        <PlusMinusCircle />
      </Button>
    </header>
    <ExerciseList workoutId={data.workout.id} exercises={data.exercises} />
  </section>
</main>
<Navbar backHref="/">
  {#snippet actions()}
    <NavbarActionItem href={`/${data.workout.id}/edit`}>
      Rename workout
    </NavbarActionItem>
    <NavbarActionItem href={`/${data.workout.id}/reorder`}>
      Reorder exercises
    </NavbarActionItem>
    <NavbarActionItem href={`/${data.workout.id}/history`}>
      View history
    </NavbarActionItem>
    <NavbarActionItem onclick={confirmDelete} variant="destructive">
      Delete workout
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
