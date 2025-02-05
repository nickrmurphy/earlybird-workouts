<script lang="ts">
  import { page } from "$app/state";
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    Page,
    PageHeader,
    Navbar,
    ExerciseSetsTable,
    Dropdown,
    DropdownItem,
  } from "$lib/components";
  import { db } from "$lib/db";
  import { dateDifferenceInMinutes, dateFormatter } from "$lib/utils";
  import {
    IconClock,
    IconDotsCircleHorizontal,
    IconTrash,
    IconWeight,
  } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";
  import { goto } from "$app/navigation";

  let history = liveQuery(() => {
    return db.history
      .where("id")
      .equals(parseInt(page.params.historyId))
      .first();
  });

  let exercises = liveQuery(() =>
    db.historyExercises
      .where("historyId")
      .equals(parseInt(page.params.historyId))
      .toArray(),
  );

  let historySets = liveQuery(() =>
    db.historySets
      .where("historyId")
      .equals(parseInt(page.params.historyId))
      .toArray(),
  );

  let runTime = $derived(
    $history && $history.endTime
      ? dateDifferenceInMinutes($history?.startTime, $history.endTime)
      : undefined,
  );

  // TODO: Move this to it's own query
  let volume = $derived(
    $historySets
      ? $historySets.reduce(
          (acc, set) => acc + (set.isSuccess ? set.count * set.weight : 0),
          0,
        )
      : undefined,
  );

  let dropdownToggle: HTMLElement | null = $state(null);

  async function confirmDelete() {
    const confirmDelete = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "Delete history", kind: "warning", okLabel: "Delete" },
    );

    if (confirmDelete) {
      await db.transaction(
        "rw",
        [db.history, db.historySets, db.historyExercises],
        async () => {
          const historyId = parseInt(page.params.historyId);
          await db.historySets.where("historyId").equals(historyId).delete();
          await db.historyExercises
            .where("historyId")
            .equals(historyId)
            .delete();
          await db.history.delete(historyId);
        },
      );
      goto(`/${page.params.workoutId}/history`);
    }
  }
</script>

<Page>
  <PageHeader title={$history?.workoutName}>
    {#snippet right()}
      <button bind:this={dropdownToggle}>
        <IconDotsCircleHorizontal class="text-accent" />
      </button>
      <Dropdown anchor={dropdownToggle}>
        <DropdownItem onclick={confirmDelete}>
          Delete <IconTrash color="var(--color-red-500)" />
        </DropdownItem>
      </Dropdown>
    {/snippet}
  </PageHeader>
  <h2 class="font-display text-muted-foreground p-1 text-lg font-semibold">
    {dateFormatter.format($history?.startTime)}
  </h2>
  <div
    class="font-display flex items-center justify-between gap-2 rounded-sm p-1 text-lg font-semibold"
  >
    <div class="flex items-center gap-2">
      <IconClock class="size-5" />
      <span>{runTime}</span>
      min.
    </div>
    <div class="flex items-center gap-2">
      <IconWeight class="size-5" />
      <span>{volume}</span>
      lbs
    </div>
  </div>
  {#each $exercises as exercise}
    <ExerciseSetsTable
      exerciseName={exercise.exerciseName}
      sets={$historySets?.filter((s) => s.exerciseId === exercise.exerciseId)}
    />
  {/each}
  <Navbar
    backHref={page.url.searchParams.has("from")
      ? page.url.searchParams.get("from") || undefined
      : `/${page.params.workoutId}/history`}
  />
</Page>
