<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';
    import { Navbar, PageHeader } from '$lib/components/page';
    import { activityStore } from './activityStore.svelte';
    import { Play, StopCircle } from '$lib/icons';

    let elapsedTime = $derived.by(() => {
        let time = activityStore.restTimer.elapsedTime;
        if (time < 10) {
            return `0${time}`;
        } else {
            return time.toString();
        }
    })

    let { data } = $props();

    async function confirmEndWorkout() {
        const confirmEnd = await confirm(
            'This action cannot be reverted. Are you sure?',
            { title: 'End workout', kind: 'warning', okLabel: 'Finish' }
        );

        if (confirmEnd) {
            activityStore.restTimer.stop();
            completeWorkout(data.activeWorkout.id);
        }
    }

    function toggleTimer() {
        if (activityStore.restTimer.isRunning) {
            activityStore.restTimer.stop();
        } else {
            activityStore.restTimer.start();
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
    <Button --width="33%" rounded="full" variant="outline" onclick={toggleTimer}>
        {#if activityStore.restTimer.isRunning}
            <StopCircle />
        {:else}
            <Play />
        {/if}
        <time data-expired="{activityStore.restTimer.isExpired}">{elapsedTime}/60s</time>
    </Button>
    <Button onclick={confirmEndWorkout} --width="66%" rounded="full">
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

    time {
        font-size: var(--font-size-0);
    }

    time[data-expired="true"] {
        /* TODO: This red sucks, change it. Also should probably make the whole button red */
        color: red;
    }
</style>