<script lang="ts">
    import { goto } from "$app/navigation";
    import { Navbar, PageHeader } from "$lib/components/page";
      import { renameWorkout } from "$lib/workoutActions";
    import Button from "../../../Button.svelte";
    import Input from "../../../Input.svelte";
    
    let { data } = $props();
    let newWorkoutName = $state(data.workout.name);
  </script>
  
  <PageHeader title="Edit workout" />
  <form id="edit-workout" onsubmit={async (e) => {
      e.preventDefault();
      const rowsAffected = await renameWorkout(data.workout.id, newWorkoutName);
      if (rowsAffected === 0) {
        console.error("Failed to rename workout");
      } else {
        goto(`/${data.workout.id}`);
      }
  }}>
      <label>
          Title
          <Input bind:value={newWorkoutName} placeholder="e.g. Upper body" required type="text" enterkeyhint="done" />
      </label>
  </form>
  <Navbar backHref="/{data.workout.id}">
      <Button type="submit" form="edit-workout" --width="100%" rounded="full">Save</Button>
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