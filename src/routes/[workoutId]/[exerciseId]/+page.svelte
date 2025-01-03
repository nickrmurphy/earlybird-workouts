<script>
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Input from "../../../Input.svelte";
    import { removeExercise, updateReps, updateSets, updateWeight } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import PageHeader from '../../../lib/components/page/PageHeader.svelte';
    import Navbar from '../../../lib/components/page/Navbar.svelte';
    import { NavbarActionItem } from '$lib/components/page';
    
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

<PageHeader title={data.exercise.name} level={2} />
<main>
    <label>
        <span>
            Weight <span class="unit">(lbs)</span>
        </span>
        <Input --font-size="var(--font-size-3)" --font-weight="var(--font-weight-7)" type="number" step={0.5} inputmode="decimal" bind:value={weight} />
    </label>
    <label>
        Sets
        <Input --font-size="var(--font-size-3)" --font-weight="var(--font-weight-7)" type="number" step={1} inputmode="numeric" bind:value={sets} />
    </label>
    <label>
        Reps
        <Input --font-size="var(--font-size-3)" --font-weight="var(--font-weight-7)" type="number" step={1} inputmode="numeric" bind:value={reps} />
    </label>
</main>
<Navbar backHref={`/${data.workoutId}`}>
    {#snippet actions()}
        <NavbarActionItem onclick={confirmDelete} variant="destructive">Delete exercise</NavbarActionItem>
    {/snippet}
</Navbar>

<style>
    main {
        display: flex;
        flex-direction: column;
        gap: var(--size-4);
        padding: var(--size-4) var(--size-2);
    }

    label {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        font-weight: var(--font-weight-6);

        span {
            display: flex;
            gap: var(--size-2);
            align-items: end;
        }

        .unit {
            color: hsl(var(--magnolia-hsl)  / 70%);
        }
    }
</style>