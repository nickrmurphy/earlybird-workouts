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
  import { db } from "$lib/db";
  import { calculateTonnagePerAttribute } from "$lib/utils";
  import { IconLoader } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";

  let history = liveQuery(() =>
    db.history.orderBy("startTime").reverse().toArray(),
  );
  let successSets = liveQuery(() => {
    return db.historySets.filter((set) => set.isSuccess).toArray();
  });

  let tonnage: Map<string, number> = $derived(
    calculateTonnagePerAttribute($successSets || [], (set) => set.historyId),
  );
</script>

<Page>
  <PageHeader title="History" />
  <section class="space-y-8">
    {#if $history}
      {#if $history.length === 0}
        <EmptyMessage
          header="No history yet."
          message="Past workout details will appear here."
        />
        <BusinessClipboard />
      {/if}
      {#each $history as item}
        <HistoryCard
          onclick={() => {
            goto(`/${item.workoutId}/history/${item.id}?from=${page.url}`);
          }}
          workoutName={item.workoutName}
          startTime={item.startTime}
          endTime={item.endTime}
          tonnage={tonnage.get(item.id) || 0}
        />
      {/each}
    {:else}
      <IconLoader class="mx-auto mt-30 animate-spin " />
    {/if}
  </section>
  <Navbar backHref="/" />
</Page>
