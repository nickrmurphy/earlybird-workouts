<script lang="ts">
  import {
    completeWorkoutSet,
    setWorkoutHistorySetReps,
    setWorkoutHistorySetWeight,
  } from "$lib/mutations";
  import {
    ActiveExerciseSet,
    Navbar,
    TimerButton,
    PageHeader,
    Page,
  } from "$lib/components";
  import { activity } from "$lib/stores";

  let { data } = $props();
</script>

<Page>
  <PageHeader title={data.exercise.name} />
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
</Page>
<Navbar backHref="/active">
  <TimerButton
    onclick={() => activity.restTimer.toggle()}
    elapsedTime={activity.restTimer.elapsedTime}
    runTimeSeconds={activity.restTimer.runTimeSeconds}
    isRunning={activity.restTimer.isRunning}
    isExpired={activity.restTimer.isExpired}
  />
</Navbar>
