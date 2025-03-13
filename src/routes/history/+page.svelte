<script lang="ts">
  import { goto } from "$app/navigation";
  import { page } from "$app/state";
  import { BusinessClipboard } from "$lib/assets";
  import {
    EmptyMessage,
    HistoryCard,
    Navbar,
    Page,
    PageHeader,
  } from "$lib/components";

  let { data } = $props();
</script>

<Page>
  <PageHeader title="History" />
  <section class="space-y-8">
    {#if data.activities.length === 0}
      <EmptyMessage
        header="No history yet."
        message="Past workout details will appear here."
      />
      <BusinessClipboard />
    {/if}
    {#each data.activities as activity (activity.id)}
      <HistoryCard
        onclick={() => {
          goto(
            `/${activity.workoutId}/history/${activity.id}?from=${page.url}`,
          );
        }}
        workoutName={activity.workoutName}
        startTime={activity.startTime}
        endTime={activity.endTime}
        tonnage={data.tonnage.get(activity.id) || 0}
      />
    {/each}
  </section>
  <Navbar backHref="/" />
</Page>
