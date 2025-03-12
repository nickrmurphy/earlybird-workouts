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
  import { db } from "$lib/db";
  import { calculateTonnagePerAttribute } from "$lib/utils";
  import { liveQuery } from "dexie";

  let { data } = $props();

  let history = liveQuery(() => {
    return db.history
      .where("workoutId")
      .equals(page.params.workoutId)
      .reverse()
      .sortBy("startTime");
  });
  let successSets = liveQuery(() => {
    return db.historySets
      .filter(
        (set) => $history.some((h) => h.id === set.historyId) && set.isSuccess,
      )
      .toArray();
  });

  let tonnage: Map<string, number> = $derived(
    calculateTonnagePerAttribute($successSets || [], (set) => set.historyId),
  );
</script>

<Page>
  <PageHeader title={data.workout.name}>
    {#snippet right()}
      <span>History</span>
    {/snippet}
  </PageHeader>
  {#if $history?.length === 0}
    <EmptyMessage
      header="No history yet."
      message="Past workout details will appear here."
    />
    <BusinessClipboard />
  {/if}
  <div class="space-y-8">
    {#each $history || [] as item (item.id)}
      <HistoryCard
        onclick={() => {
          goto(`/${page.params.workoutId}/history/${item.id}`);
        }}
        startTime={item.startTime}
        endTime={item.endTime || undefined}
        tonnage={tonnage.get(item.id) || 0}
      />
    {/each}
  </div>
  <Navbar backHref="/{page.params.workoutId}" />
</Page>
