<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from "../../Button.svelte";
    import Dialog from "../../Dialog.svelte";
    import ExerciseList from "../../ExerciseList.svelte";
    import ExerciseSelectList from "../../ExerciseSelectList.svelte";
    import Heading from "../../Heading.svelte";
    import PencilEdit from "../../icons/PencilEdit.svelte";
    import Input from "../../Input.svelte";
    import { addExercise, deleteWorkout, removeExercise, startWorkout } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import PageNavHeader from '../../PageNavHeader.svelte';

    let { data } = $props();

    let filterQuery = $state("");
    let exerciseOptions = $derived.by(() => {
        const filteredExercises = filterQuery === ""  ? data.allExercises : data.allExercises?.filter((exercise) =>
            exercise.name.toLowerCase().includes(filterQuery.toLowerCase())
        );

        return filteredExercises?.map((exercise) => ({
            value: exercise.id,
            label: exercise.name,
        })) || [];
    });
    
    let selectedOptions = $derived(data.exercises.map((exercise) => exercise.id));

    async function confirmDelete() {
        const confirmDelete = await confirm(
            'This action cannot be reverted. Are you sure?',
            { title: 'Delete workout', kind: 'warning', okLabel: 'Delete' }
        );

        if (confirmDelete) {
            await deleteWorkout(data.workout.id).then(() => {
                goto("/");
            });
        }
    }
</script>

<PageNavHeader backHref="/">
    {#snippet endContent()}
        <button onclick={confirmDelete}>Delete</button> 
    {/snippet}
</PageNavHeader>
<header>
    <Heading>{data.workout.name}</Heading>
</header>
<main>
    <section>
        <header>
            <Heading level={2}>Exercises</Heading>
            <Button variant="outline" popovertarget="add-exercise">
                <PencilEdit />
            </Button>
        </header>
        <ExerciseList
            workoutId={data.workout.id}
            exercises={data.exercises}
        />
    </section>
    <footer>
        <Button --width="100%" size="lg" onclick={() => startWorkout(data.workout.id)}>Start workout</Button>
    </footer>
</main>

<Dialog id="add-exercise" popover="auto">
    {#snippet header()}
        <h2>
            Select exercises
            <span class="selected-count">{selectedOptions.length}</span>
        </h2>
        <Input bind:value={filterQuery} />
    {/snippet}
    <ExerciseSelectList
        selected={selectedOptions}    
        options={exerciseOptions}
        onAdd={async (value) => {
            await addExercise(data.workout.id, value);
        }}
        onRemove={async (value) => {
            await removeExercise(data.workout.id, value);
        }}
    />
    {#snippet actions()}
        <Button popovertargetaction="hide" popovertarget="add-exercise">
            Done
        </Button>
    {/snippet}
</Dialog>

<style>
    button {
            /* TODO: replace red */
            color: red;
    }

    header, main, section {
        padding: var(--size-1) var(--size-2);
    }

    section {
        padding: var(--size-1) 0;
        header {
            padding: var(--size-3) var(--size-1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
    }
    
    h2 {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    footer {
        position: absolute;
        bottom: env(safe-area-inset-bottom);
        left: env(safe-area-inset-left);
        right: env(safe-area-inset-right);
        display: flex;
        gap: var(--size-2);
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: var(--size-3);
    }

    .selected-count {
        font-size: var(--font-size-1);
        border: 1px solid var(--yellow);
        border-radius: var(--radius-round);
        padding: var(--size-1) var(--size-2);
        font-weight: var(--font-weight-7);
        background-color: hsl(var(--yellow-hsl) / 10%);
        width: fit-content;
        min-width: var(--size-3);
        justify-content: center;
        display: flex;
    }
</style>