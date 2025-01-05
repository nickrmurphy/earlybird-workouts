<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';
    import { Navbar, PageHeader } from '$lib/components/page';
    import { activityStore } from './activityStore.svelte';
    import { Play, StopCircle } from '$lib/icons';
    import NavbarActionItem from '$lib/components/page/NavbarActionItem.svelte';

    let { data } = $props();


    let elapsedTime = $derived.by(() => {
        let time = activityStore.restTimer.elapsedTime;
        if (time < 10) {
            return `0${time}`;
        } else {
            return time.toString();
        }
    });

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
    {#snippet actions()}
        <NavbarActionItem --justify-content="space-between">
            Rest time:
            <select bind:value={activityStore.restTimer.runTimeSeconds}>
                {#each [10, 20, 30, 45, 60, 90, 120, 180] as time}
                    <option value={time}>{time}s</option>
                {/each}
            </select>
            <!-- <input type="range" step={5} min={5} max={180} bind:value={restTimeSeconds} /> -->
        </NavbarActionItem>
    {/snippet}
    <Button --width="50%" rounded="full" variant="outline" onclick={toggleTimer}>
        {#if activityStore.restTimer.isRunning}
            <StopCircle />
        {:else}
            <Play />
        {/if}
        <time data-expired="{activityStore.restTimer.isExpired}">{elapsedTime}/{activityStore.restTimer.runTimeSeconds} s.</time>
    </Button>
    <Button onclick={confirmEndWorkout} --width="50%" rounded="full">
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

    select {
        padding: var(--size-2) var(--size-3);
        border-radius: var(--radius-3);
        border: 1px solid var(--yellow);
        background: none;
        color: var(--black);
    }
</style>