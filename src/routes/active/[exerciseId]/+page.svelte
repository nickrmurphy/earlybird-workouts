<script lang="ts">
  import { completeWorkoutSet, setWorkoutHistorySetReps, setWorkoutHistorySetWeight } from "$lib/workoutHistoryActions";
  import ActiveExerciseSet from "../../../ActiveExerciseSet.svelte";
  import Heading from "../../../Heading.svelte";
  import PageNavHeader from "../../../PageNavHeader.svelte";

    let { data } = $props();
</script>

<PageNavHeader backHref="/active" />
<header>
  <Heading level={2}>{data.exercise.name}</Heading>
</header>
<div>
  {#each data.exerciseSets as set}
    <ActiveExerciseSet
      setId={set.id}
      reps={set.reps}
      weight={set.weight}
      isComplete={set.isComplete > 0}
      onToggleComplete={(isComplete) => completeWorkoutSet(set.id, isComplete)}
      onRepsChange={(reps) => setWorkoutHistorySetReps(set.id, reps)}
      onWeightChange={(weight) => setWorkoutHistorySetWeight(set.id, weight)}
    />
  {/each}
</div>

<style>

  div {
    display: flex;
    flex-direction: column;
    gap: var(--size-1);
  }

  header, div {
    padding: var(--size-2);
  }
</style>