<script lang="ts">
  import { goto } from "$app/navigation";
  import { createWorkout } from "$lib/workoutActions";
  import Button from "../../Button.svelte";
  import Input from "../../Input.svelte";
  import PageNavHeader from "../../PageNavHeader.svelte";

  let newWorkoutName = $state("");
</script>

<PageNavHeader backHref="/" title="Create a workout" />
<form onsubmit={async (e) => {
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
    <footer>
        <Button --width="100%" type="submit">Save</Button>
    </footer>
</form>

<style>
    form {
        padding: var(--size-2);
    }

    label {
        display: grid;
        gap: var(--size-2);
        font-weight: var(--font-weight-6);
    }

    footer {
        position: absolute;
        padding: var(--size-2);

        bottom: env(safe-area-inset-bottom);
        left: env(safe-area-inset-left);
        right: env(safe-area-inset-right);
    }
</style>