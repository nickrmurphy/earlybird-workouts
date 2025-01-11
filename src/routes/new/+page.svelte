<script lang="ts">
  import { goto } from "$app/navigation";
  import { createWorkout } from "$lib/mutations";
  import { Button, PageHeader, Navbar } from "$lib/components";

  let newWorkoutName = $state("");
</script>

<PageHeader title="Create a workout" />
<form
  id="new-workout"
  onsubmit={async (e) => {
    e.preventDefault();
    const newId = await createWorkout(newWorkoutName);
    if (newId) {
      goto(`/${newId}/exercises`);
    }
  }}
>
  <label>
    Title
    <input
      bind:value={newWorkoutName}
      placeholder="e.g. Upper body"
      required
      type="text"
      enterkeyhint="next"
    />
  </label>
</form>
<Navbar backHref="/">
  <Button type="submit" form="new-workout" --width="100%" rounded="full"
    >Save</Button
  >
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
