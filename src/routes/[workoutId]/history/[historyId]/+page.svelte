<script lang="ts">
  import { Navbar, ExerciseSetTable, Page, PageHeader } from "$lib/components";
  import { dateFormatter } from "$lib/utils";

  let { data } = $props();
  let historyDate = $derived.by(() => {
    const startTime = data.workoutHistory.find(
      (history) => history.id === data.historyId,
    )?.startTime;
    if (startTime) {
      return dateFormatter.format(new Date(startTime));
    } else {
      console.error("History not found");
      return "";
    }
  });
</script>

<Page>
  <PageHeader title={data.workout.name}>
    {#snippet right()}
      <time>{historyDate}</time>
    {/snippet}
  </PageHeader>

  {#each data.exerciseHistory as exercise}
    <ExerciseSetTable
      exerciseName={exercise.exerciseName}
      sets={exercise.sets}
    />
  {/each}
</Page>
<Navbar backHref={`/${data.workout.id}/history`}></Navbar>

<style>
  time {
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-2);
  }
</style>
