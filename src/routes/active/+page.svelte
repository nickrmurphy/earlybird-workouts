<script lang="ts">
    import Heading from '../../Heading.svelte';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';

    let { data } = $props();
</script>

<Heading>{data.activeWorkout.workoutName}</Heading>
{#each data.workoutExercises as exercise }
    <a href={`/active/${exercise.id}`}>
        <ActiveExerciseCard
            exerciseName={exercise.name}
            setCount={exercise.sets}
            completeSets={exercise.completeSets}
            isComplete={exercise.isComplete > 0}
        />
    </a>
{/each}
<footer>
    <Button onclick={() => completeWorkout(data.activeWorkout.id)} --width="100%">
        End workout
    </Button>
</footer>

<style>
    footer {
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: var(--size-2);
        padding: var(--size-2);
        bottom: env(safe-area-inset-bottom);
        left: env(safe-area-inset-left);
        right: env(safe-area-inset-right);
    }
</style>