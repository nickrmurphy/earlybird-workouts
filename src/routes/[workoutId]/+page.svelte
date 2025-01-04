<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from "../../Button.svelte";
    import ExerciseList from "../../ExerciseList.svelte";
    import PencilEdit from "../../icons/PencilEdit.svelte";
    import { deleteWorkout, startWorkout } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import { Navbar, PageHeader, Heading } from '$lib/components/page';
    import NavbarActionItem from '$lib/components/page/NavbarActionItem.svelte';

    let { data } = $props();

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

<PageHeader title={data.workout.name} />
<main>
    <section>
        <header>
            <label for="edit-workout">
                <Heading level={2}>Exercises</Heading>
            </label>
            <Button id="edit-workout" variant="ghost" onclick={() => goto(`/${data.workout.id}/exercises`)}>
                <PencilEdit />
            </Button>
        </header>
        <ExerciseList
            workoutId={data.workout.id}
            exercises={data.exercises}
        />
    </section>
</main>
<Navbar backHref="/">
    {#snippet actions()}
        <NavbarActionItem onclick={() => goto(`/${data.workout.id}/history`)}>
            View history
        </NavbarActionItem>
        <NavbarActionItem onclick={confirmDelete} variant="destructive">
            Delete workout
        </NavbarActionItem>
    {/snippet}
    <Button disabled={data.exercises.length === 0} --width="100%" class="btn" rounded="full" onclick={() => startWorkout(data.workout.id)}>
        Start workout
    </Button>
</Navbar>

<style>
    main {
        padding: var(--size-2);
        display: flex;
        flex-direction: column;
        gap: var(--size-4);

        padding-bottom: var(--navbar-height);
    }

    header {
            display: flex;
            align-items: center;
            justify-content: space-between;
    }
</style>