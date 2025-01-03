<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';
    import { Navbar, PageHeader } from '$lib/components/page';

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

<PageHeader title={data.activeWorkout.workoutName} />
<main>
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
</main>
<Navbar>
    <Button onclick={confirmEndWorkout} --width="100%" rounded="full">
        End workout
    </Button>
</Navbar>

<style>
    main {
        padding: var(--size-2);
        margin-top: var(--size-3);
        display: flex;
        flex-direction: column;
        gap: var(--size-3);

        padding-bottom: var(--navbar-height);
    }
</style>