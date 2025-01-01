<script lang="ts">
    import Heading from '../../Heading.svelte';
    import Button from '../../Button.svelte';
    import { completeWorkout } from '$lib/workoutHistoryActions';
    import ActiveExerciseCard from '../../ActiveExerciseCard.svelte';
    import { differenceInSeconds, differenceInHours } from "date-fns";
  import { onMount } from 'svelte';

    let { data } = $props();
    let elapsedSeconds = $state(differenceInSeconds(new Date(), new Date(data.activeWorkout.startTime)));
    let formattedTime = $derived.by(() => {
        const hours = Math.floor(elapsedSeconds / 3600);
        const minutes = Math.floor((elapsedSeconds % 3600) / 60);
        const seconds = elapsedSeconds % 60;

        return `${hours}:${minutes < 10 ? `0${minutes}` : minutes}:${seconds < 10 ? `0${seconds}` : seconds}`;
    });

    onMount(() => {
        const interval = setInterval(() => {
            elapsedSeconds++;
        }, 1000);

        return () => clearInterval(interval);
    });
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
    <time>{formattedTime}</time>
    <Button onclick={() => completeWorkout(data.activeWorkout.id)} --width="100%">
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
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: var(--size-3);
        padding: var(--size-2);
        bottom: env(safe-area-inset-bottom);
        left: env(safe-area-inset-left);
        right: env(safe-area-inset-right);

        time {
            font-size: var(--font-size-3);
            font-weight: var(--font-weight-5);
            border: 1px solid var(--magnolia);
            padding: var(--size-2) var(--size-3);
            min-width: var(--size-10);
            justify-content: center;
            display: flex;
            border-radius: var(--radius-round);
        }
    }
</style>