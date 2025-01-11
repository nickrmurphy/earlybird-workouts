<script lang="ts">
  import { goto } from "$app/navigation";
  import { PageHeader } from "$lib/components/page";
  import Navbar from "$lib/components/page/Navbar.svelte";
  import { dateFormatter } from "$lib/utils";
  import { ChevronRight } from "$lib/icons";

  let { data } = $props();
</script>

<PageHeader level={2} title={`${data.workout.name} History`} />
<main>
  <ol>
    {#each data.workoutHistory as history}
      <li>
        <button
          onclick={() => goto(`/${data.workout.id}/history/${history.id}`)}
        >
          {dateFormatter.format(new Date(history.startTime))}
          <ChevronRight />
        </button>
      </li>
    {/each}
  </ol>
</main>
<Navbar backHref={`/${data.workout.id}`} />

<style>
  main {
    padding: var(--size-2);
    padding-top: var(--size-5);
  }

  ol {
    display: grid;

    :not(:first-child) {
      border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
    }

    li {
      width: 100%;

      button {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: var(--size-4) var(--size-2);
        width: 100%;

        font-weight: var(--font-weight-6);
        font-size: var(--font-size-3);
      }
    }
  }
</style>
