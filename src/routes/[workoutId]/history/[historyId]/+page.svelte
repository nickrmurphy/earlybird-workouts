<script lang="ts">
  import Navbar from "$lib/components/page/Navbar.svelte";
  import PageHeader from "$lib/components/page/PageHeader.svelte";
  import { dateFormatter } from "$lib/utils";
  import ExerciseSetTable from "../../../../ExerciseSetTable.svelte";

  let { data } = $props();
  let historyDate = $derived.by(() => {
    const startTime = data.workoutHistory.find((history) => history.id === data.historyId)?.startTime;
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
<Navbar backHref={`/${data.workout.id}/history`}>
</Navbar>

<style>
    main {
        padding: var(--size-2);
        padding-bottom: var(--navbar-height);
        display: flex;
        flex-direction: column;
        gap: var(--size-5);
    }
</style>