<script lang="ts">
    import Heading from '../../Heading.svelte';
    import Button from '../../Button.svelte';
  import { completeWorkout } from '$lib/workoutHistoryActions';

    let { data } = $props();
</script>

<Heading>Active workout</Heading>
{#each data.workoutExercises as exercise }
    <a href={`/active/${exercise.id}`}>
        <div>
            <h2>{exercise.name}</h2>
            <p>{exercise.sets} sets</p>
            <p>Complete: {exercise.isComplete > 0}</p>
        </div>
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