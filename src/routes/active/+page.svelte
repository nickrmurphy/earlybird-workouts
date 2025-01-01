<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Heading from '../../Heading.svelte';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';

    let { data } = $props();

    async function confirmEndWorkout() {
        const confirmEnd = await confirm(
            'This action cannot be reverted. Are you sure?',
            { title: 'End workout', kind: 'warning', okLabel: 'Finish' }
        );

        if (confirmEnd) {
            completeWorkout(data.activeWorkout.id);
        }
    }
</script>

<header>
    <Heading>{data.activeWorkout.workoutName}</Heading>
</header>
<div>
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
</div>
<footer>
    <Button onclick={confirmEndWorkout} --width="100%">
        End workout
    </Button>
</footer>

<style>
    header, div {
        padding: var(--size-2);
    }

    div {
        margin-top: var(--size-3);
        display: flex;
        flex-direction: column;
        gap: var(--size-3);
    }

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