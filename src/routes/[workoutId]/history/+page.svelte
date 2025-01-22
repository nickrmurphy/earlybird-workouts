<script lang="ts">
  import { goto } from "$app/navigation";
  import { BusinessClipboard } from "$lib/assets";
  import { Navbar, EmptyMessage, Page, PageHeader } from "$lib/components";
  import { dateFormatter } from "$lib/utils";
  import { IconChevronRight } from "@tabler/icons-svelte";

  let { data } = $props();
</script>

<Page>
  <PageHeader title={data.workout.name}>
    {#snippet right()}
      <h3>History</h3>
    {/snippet}
  </PageHeader>
  <ol>
    {#if data.workoutHistory.length === 0}
      <EmptyMessage
        header="No history yet."
        message="Past workout details will appear here."
      />
      <BusinessClipboard />
    {/if}
    {#each data.workoutHistory as history}
      <li>
        <button
          onclick={() => goto(`/${data.workout.id}/history/${history.id}`)}
        >
          {dateFormatter.format(new Date(history.startTime))}
          <IconChevronRight />
        </button>
      </li>
    {/each}
  </ol>
</Page>
<Navbar backHref={`/${data.workout.id}`} />

<style>
  h3 {
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-2);
  }

  ol {
    display: grid;

    :not(:first-child) {
      border-top: 1px solid var(--border-color);
    }

    li {
      width: 100%;

      button {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: var(--size-4) var(--size-2);
        width: 100%;
        color: var(--foreground);
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-2);
      }
    }
  }
</style>
