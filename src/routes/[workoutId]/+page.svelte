<script lang="ts">
    import { confirm } from '@tauri-apps/plugin-dialog';
    import Button from "../../Button.svelte";
    import ExerciseList from "../../ExerciseList.svelte";
    import Heading from "../../Heading.svelte";
    import PencilEdit from "../../icons/PencilEdit.svelte";
    import { deleteWorkout, startWorkout } from "$lib/workoutActions";
    import { goto } from '$app/navigation';
    import PageNavHeader from '../../PageNavHeader.svelte';

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

<PageNavHeader backHref="/" title={data.workout.name}>
    {#snippet endContent()}
        <button onclick={confirmDelete}>Delete</button> 
    {/snippet}
</PageNavHeader>
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
    <footer>
        <Button disabled={data.exercises.length === 0} --width="100%" size="lg" onclick={() => startWorkout(data.workout.id)}>Start workout</Button>
    </footer>
</main>

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

    main {
        padding-bottom: calc(var(--size-5) + env(safe-area-inset-bottom));
    }

    footer {
        position: fixed;
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
</style>