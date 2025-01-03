<script lang="ts">
  import { goto } from "$app/navigation";
  import { createWorkout } from "$lib/workoutActions";
  import Button from "../../Button.svelte";
  import Input from "../../Input.svelte";
  import PageHeader from "../../PageHeader.svelte";
  import Navbar from "../Navbar.svelte";

  let newWorkoutName = $state("");
</script>

<PageHeader title="Create a workout" />
<form id="new-workout" onsubmit={async (e) => {
    e.preventDefault();
    const newId = await createWorkout(newWorkoutName);
    if (newId) {
      goto(`/${newId}`);
    }
}}>
    <label>
        Title
        <Input bind:value={newWorkoutName} placeholder="e.g. Upper body" required type="text" />
    </label>
</form>
<Navbar backHref="/">
    <Button type="submit" form="new-workout" --width="100%" rounded="full">Save</Button>
</Navbar>

<style>
    form {
        padding: var(--size-2);
    }

    label {
        display: grid;
        gap: var(--size-2);
        font-weight: var(--font-weight-6);
    }
</style>