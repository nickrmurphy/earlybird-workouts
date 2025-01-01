<script lang="ts">
  import { completeWorkoutSet, setWorkoutHistorySetReps, setWorkoutHistorySetWeight } from "$lib/workoutHistoryActions";
  import ActiveExerciseSet from "../../../ActiveExerciseSet.svelte";
  import Heading from "../../../Heading.svelte";

    let { data } = $props();
</script>

<a href="/active">Back</a>
<Heading level={2}>{data.exercise.name}</Heading>

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
