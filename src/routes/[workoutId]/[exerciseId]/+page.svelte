<script>
    import Heading from "../../../Heading.svelte";
    import { ArrowLeft } from "../../../icons";
    import Input from "../../../Input.svelte";
    import { updateReps, updateSets, updateWeight } from "./actions";
    
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
</script>

<nav>
    <a href={`/${data.workoutId}`}>
        <ArrowLeft />
        Back
    </a>
</nav>
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
     nav {
        padding: var(--size-3) var(--size-2);
        a {
            display: flex;
            align-items: center;
            gap: var(--size-2);
            :global(svg) {
                height: var(--size-4);
                width: var(--size-4);
            }
        }
    }

    header, main {
        padding: var(--size-1) var(--size-2);
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