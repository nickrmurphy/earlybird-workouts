<script lang="ts">
  import { goto } from "$app/navigation";
  import { page } from "$app/state";
  import { BusinessClipboard } from "$lib/assets";
  import { EmptyMessage, HistoryCard, Page, PageHeader } from "$lib/components";
  import Navbar from "$lib/components/page/Navbar.svelte";
  import { db, type History, type HistorySet } from "$lib/db";
  import { calculateTonnagePerAttribute } from "$lib/utils";
  import { liveQuery } from "dexie";

  let workout = liveQuery(() => db.workouts.get(page.params.workoutId));

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

  let tonnage: Map<number, number> = $derived(
    calculateTonnagePerAttribute($successSets || [], (set) => set.historyId),
  );
</script>

<Page>
  <PageHeader title={$workout?.name}>
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
    {#each $history || [] as item}
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
