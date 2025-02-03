<script>
  import { page } from "$app/state";
  import { Page, PageHeader, Navbar, ExerciseSetsTable } from "$lib/components";
  import { db } from "$lib/db";
  import { dateFormatter } from "$lib/utils";
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
</script>

<Page>
  <PageHeader title={$history?.workoutName}>
    {#snippet right()}
      <span>{dateFormatter.format($history?.startTime)}</span>
    {/snippet}
  </PageHeader>
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
