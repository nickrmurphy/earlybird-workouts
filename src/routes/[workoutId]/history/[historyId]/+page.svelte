<script lang="ts">
  import { Navbar, PageHeader, ExerciseSetTable } from "$lib/components";
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

<PageHeader title={historyDate} level={2} />
<main>
  {#each data.exerciseHistory as exercise}
    <ExerciseSetTable
      exerciseName={exercise.exerciseName}
      sets={exercise.sets}
    />
  {/each}
</main>
<Navbar backHref={`/${data.workout.id}/history`}></Navbar>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-5);
    padding: var(--size-2);
    padding-bottom: var(--navbar-height);
  }
</style>
