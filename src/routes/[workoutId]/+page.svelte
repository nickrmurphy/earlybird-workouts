<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from "../../Button.svelte";
    import ExerciseList from "../../ExerciseList.svelte";
    import PencilEdit from "../../icons/PencilEdit.svelte";
    import { deleteWorkout, startWorkout } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import { fly } from 'svelte/transition';
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

    let dropdownOpen = $state(false);
</script>

<PageHeader title={data.workout.name} />
<main>
    <section>
        <header>
            <Heading level={2}>Exercises</Heading>
            <Button variant="outline" onclick={() => goto(`/${data.workout.id}/exercises`)}>
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
        <NavbarActionItem onclick={confirmDelete} variant="destructive">Delete workout</NavbarActionItem>
    {/snippet}
    {#if dropdownOpen}
        <div class="dropdown-content" transition:fly={{ y: 100, duration: 200 }} >
            <div class="item">Delete workout</div>
        </div>
    {/if}
    <Button disabled={data.exercises.length === 0} --width="100%" class="btn" rounded="full" onclick={() => startWorkout(data.workout.id)}>
        Start workout
    </Button>
</Navbar>

<style>
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

    main {
        padding-bottom: calc(var(--size-5) + env(safe-area-inset-bottom));
    }
</style>