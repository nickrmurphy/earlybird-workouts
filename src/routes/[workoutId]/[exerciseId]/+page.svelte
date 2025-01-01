<script>
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Heading from "../../../Heading.svelte";
    import Input from "../../../Input.svelte";
    import { removeExercise, updateReps, updateSets, updateWeight } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import PageNavHeader from '../../../PageNavHeader.svelte';
    
    let { data } = $props();

    let weight = $state(data.exercise.weight);
    let sets = $state(data.exercise.sets);
    let reps = $state(data.exercise.reps);

    $effect(() => {
        updateWeight(data.workoutId, data.exercise.id, weight);
    });

    $effect(() => {
        updateSets(data.workoutId, data.exercise.id, sets);
    });

    $effect(() => {
        updateReps(data.workoutId, data.exercise.id, reps);
    });

    async function confirmDelete() {
        const confirmDelete = await confirm(
            'This action cannot be reverted. Are you sure?',
            { title: 'Delete exercise', kind: 'warning', okLabel: 'Delete' }
        );

        if (confirmDelete) {
            await removeExercise(data.workoutId, data.exercise.id).then(() => {
                goto(`/${data.workoutId}`);
            });
        }
    }
</script>

<PageNavHeader backHref={`/${data.workoutId}`}>
    {#snippet endContent()}
        <button onclick={confirmDelete}>Delete</button>    
    {/snippet}
</PageNavHeader>
<header>
    <Heading level={2}>{data.exercise.name}</Heading>
</header>
<main>
    <label>
        Weight
        <Input type="number" step={0.5} inputmode="decimal" bind:value={weight} />
    </label>
    <label>
        Sets
        <Input type="number" step={1} inputmode="numeric" bind:value={sets} />
    </label>
    <label>
        Reps
        <Input  type="number" step={1} inputmode="numeric" bind:value={reps} />
    </label>
</main>

<style>
    button {
        /* TODO: Replace red */
        color: red;
    }

    header, main {
        padding: var(--size-1) var(--size-2);
    }

    header {
        margin-bottom: var(--size-4);
    }

    main {
        display: flex;
        flex-direction: column;
        gap: var(--size-4);
    }

    label {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        font-weight: var(--font-weight-6);
    }

</style>