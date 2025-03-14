<script lang="ts">
  import { goto } from "$app/navigation";
  import { page } from "$app/state";
  import { BusinessClipboard } from "$lib/assets";
  import {
    EmptyMessage,
    HistoryCard,
    Page,
    PageHeader,
    Navbar,
  } from "$lib/components";

  let { data } = $props();
</script>

<Page>
  <PageHeader title={data.workout.name}>
    {#snippet right()}
      <span>History</span>
    {/snippet}
  </PageHeader>
  {#if data.activities.length === 0}
    <EmptyMessage
      header="No history yet."
      message="Past workout details will appear here."
    />
    <BusinessClipboard />
  {/if}
  <div class="space-y-8">
    {#each data.activities as activity (activity.id)}
      <HistoryCard
        onclick={() => {
          goto(`/${page.params.workoutId}/history/${activity.id}`);
        }}
        startTime={activity.startTime}
        endTime={activity.endTime || undefined}
        tonnage={data.tonnage.get(activity.id) || 0}
      />
    {/each}
  </div>
  <Navbar backHref="/{page.params.workoutId}" />
</Page>
