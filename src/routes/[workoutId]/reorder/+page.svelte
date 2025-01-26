<script lang="ts">
  import { Button, Navbar, Page, PageHeader } from "$lib/components";
  import { flip } from "svelte/animate";
  import { updatePosition } from "$lib/mutations";
  import { goto } from "$app/navigation";
  import { IconChevronDown, IconChevronUp } from "@tabler/icons-svelte";
  import { arraymove } from "$lib/utils.js";

  let { data } = $props();

  let orderedExercises = $state(data.exercises);
  let isChanged = $derived.by(() => {
    let isChanged = false;
    data.exercises.forEach((exercise, idx) => {
      if (orderedExercises[idx].id !== exercise.id) {
        isChanged = true;
      }
    });

    return isChanged;
  });
</script>

<Page>
  <PageHeader title={data.workout.name} />
  <form
    id="reorder-exercises"
    onsubmit={async (e) => {
      e.preventDefault();
      const promises: Promise<unknown>[] = [];
      orderedExercises.forEach((exercise, idx) => {
        promises.push(updatePosition(data.workout.id, exercise.id, idx + 1));
      });
      await Promise.all(promises).then(() => {
        goto(`/${data.workout.id}`);
      });
    }}
  >
    <ul>
      {#each orderedExercises as exercise, idx (exercise.id)}
        <li animate:flip={{ duration: 300 }}>
          {exercise.name}
          <div>
            <Button
              rounded="full"
              disabled={idx === 0}
              variant="outline"
              type="button"
              onclick={() => arraymove(orderedExercises, idx, idx - 1)}
            >
              <IconChevronUp />
            </Button>
            <Button
              rounded="full"
              variant="outline"
              disabled={idx === orderedExercises.length - 1}
              type="button"
              onclick={() => arraymove(orderedExercises, idx, idx + 1)}
            >
              <IconChevronDown />
            </Button>
          </div>
        </li>
      {/each}
    </ul>
  </form>
  <Navbar backHref="/{data.workout.id}">
    <Button
      form="reorder-exercises"
      --width="100%"
      rounded="full"
      disabled={!isChanged}
    >
      Save changes
    </Button>
  </Navbar>
</Page>

<style>
  form {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    padding: var(--size-2);
  }

  ul {
    display: flex;
    flex-direction: column;
    :not(:first-child) {
      border-top: 1px solid var(--border-color);
    }
  }

  li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: var(--size-2);
    padding: var(--size-4) 0;
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-2);

    div {
      display: flex;
      gap: var(--size-2);
    }
  }
</style>
