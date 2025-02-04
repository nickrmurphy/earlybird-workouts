<script>
  import { page } from "$app/state";
  import { Page, PageHeader, Navbar, ExerciseSetsTable } from "$lib/components";
  import { db } from "$lib/db";
  import { dateDifferenceInMinutes, dateFormatter } from "$lib/utils";
  import { IconClock, IconWeight } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";

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

  let volume = $derived(
    $historySets
      ? $historySets.reduce((acc, set) => acc + set.count * set.weight, 0)
      : undefined,
  );
</script>

<Page>
  <PageHeader title={$history?.workoutName}>
    {#snippet right()}
      <span>{dateFormatter.format($history?.startTime)}</span>
    {/snippet}
  </PageHeader>
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
