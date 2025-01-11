<script lang="ts">
  import {
    completeWorkoutSet,
    setWorkoutHistorySetReps,
    setWorkoutHistorySetWeight,
  } from "$lib/mutations";
  import {
    ActiveExerciseSet,
    PageHeader,
    Navbar,
    Button,
  } from "$lib/components";
  import { activity } from "$lib/stores";
  import { Play, StopCircle } from "$lib/icons";

  let { data } = $props();

  // TODO: Make a format util
  let elapsedTime = $derived.by(() => {
    let time = activity.restTimer.elapsedTime;
    if (time < 10) {
      return `0${time}`;
    } else {
      return time.toString();
    }
  });

  function toggleTimer() {
    if (activity.restTimer.isRunning) {
      activity.restTimer.stop();
    } else {
      activity.restTimer.start();
    }
  }
</script>

<PageHeader title={data.exercise.name} level={2} />
<main>
  {#each data.exerciseSets as set}
    <ActiveExerciseSet
      setId={set.id}
      reps={set.reps}
      weight={set.weight}
      isComplete={set.isComplete > 0}
      onToggleComplete={(isComplete) => {
        if (isComplete) {
          activity.restTimer.stop();
          activity.restTimer.start();
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
    {#if activity.restTimer.isRunning}
      <StopCircle />
    {:else}
      <Play />
    {/if}
    <time data-expired={activity.restTimer.isExpired}>{elapsedTime}/60s</time>
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
