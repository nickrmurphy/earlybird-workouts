<script lang="ts">
  import { completeWorkoutSet, setWorkoutHistorySetReps, setWorkoutHistorySetWeight } from "$lib/workoutHistoryActions";
  import ActiveExerciseSet from "../../../ActiveExerciseSet.svelte";
  import PageHeader from "../../../lib/components/page/PageHeader.svelte";
  import Navbar from "../../../lib/components/page/Navbar.svelte";
  import { activityStore } from "../activityStore.svelte";
  import Button from "../../../Button.svelte";
  import { Play, StopCircle } from "$lib/icons";

    let { data } = $props();

    let elapsedTime = $derived.by(() => {
        let time = activityStore.restTimer.elapsedTime;
        if (time < 10) {
            return `0${time}`;
        } else {
            return time.toString();
        }
    })

    function toggleTimer() {
        if (activityStore.restTimer.isRunning) {
            activityStore.restTimer.stop();
        } else {
            activityStore.restTimer.start();
        }
    }
</script>

<PageHeader title={data.exercise.name} level={2}/>
<main>
  {#each data.exerciseSets as set}
    <ActiveExerciseSet
      setId={set.id}
      reps={set.reps}
      weight={set.weight}
      isComplete={set.isComplete > 0}
      onToggleComplete={(isComplete) => {
        if (isComplete) {
          activityStore.restTimer.stop();
          activityStore.restTimer.start();
        }
        completeWorkoutSet(set.id, isComplete);
      }}
      onRepsChange={(reps) => setWorkoutHistorySetReps(set.id, reps)}
      onWeightChange={(weight) => setWorkoutHistorySetWeight(set.id, weight)}
    />
  {/each}
</main>
<Navbar backHref="/active">
  <Button --width="100%" rounded="full" variant="outline" onclick={toggleTimer}>
    {#if activityStore.restTimer.isRunning}
        <StopCircle />
    {:else}
        <Play />
    {/if}
    <time data-expired="{activityStore.restTimer.isExpired}">{elapsedTime}/60s</time>
  </Button>
</Navbar>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-1);
    padding: var(--size-2);
  }
</style>