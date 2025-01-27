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
  import { IconInfoCircle } from "@tabler/icons-svelte";
  import InstructionsDrawer from "$lib/components/InstructionsDrawer.svelte";

  let { data } = $props();

  let showInstructions = $state(false);
</script>

<Page>
  <PageHeader title={data.exercise.name}>
    {#snippet right()}
      <button onclick={() => (showInstructions = true)}>
        <IconInfoCircle size={24} color="var(--muted-foreground)" />
      </button>
    {/snippet}
  </PageHeader>
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
<InstructionsDrawer
  name="Instructions"
  instructions={data.instructions}
  bind:open={showInstructions}
/>
