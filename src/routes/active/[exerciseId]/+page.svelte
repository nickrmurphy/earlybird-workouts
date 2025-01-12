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
    TimerButton,
  } from "$lib/components";
  import { activity } from "$lib/stores";

  let { data } = $props();
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
  <TimerButton
    onclick={() => activity.restTimer.toggle()}
    elapsedTime={activity.restTimer.elapsedTime}
    runTimeSeconds={activity.restTimer.runTimeSeconds}
    isRunning={activity.restTimer.isRunning}
    isExpired={activity.restTimer.isExpired}
  />
</Navbar>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-1);
    padding: var(--size-2);
  }
</style>
