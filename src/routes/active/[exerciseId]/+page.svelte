<script lang="ts">
  import { completeWorkoutSet, setWorkoutHistorySetReps, setWorkoutHistorySetWeight } from "$lib/workoutHistoryActions";
  import ActiveExerciseSet from "../../../ActiveExerciseSet.svelte";
  import PageHeader from "../../../lib/components/page/PageHeader.svelte";
  import Navbar from "../../../lib/components/page/Navbar.svelte";

    let { data } = $props();
</script>

<PageHeader title={data.exercise.name} level={2}/>
<main>
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
</main>
<Navbar backHref="/active" />

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-1);
    padding: var(--size-2);
  }
</style>