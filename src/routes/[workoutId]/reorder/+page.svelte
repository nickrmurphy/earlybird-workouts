<script lang="ts">
    import { PageHeader } from "$lib/components/page";
    import Navbar from "$lib/components/page/Navbar.svelte";
    import ChevronDown from "$lib/icons/ChevronDown.svelte";
    import ChevronUp from "$lib/icons/ChevronUp.svelte";
    import { flip } from "svelte/animate";
    import Button from "../../../Button.svelte";
  import { updatePosition } from "$lib/workoutActions";
  import { goto } from "$app/navigation";
    let { data } = $props();

    let orderedExercises = $state(data.exercises);
    let isChanged = $derived.by(() => {
        let isChanged = false;
        data.exercises.forEach((exercise, idx) => {
            if (orderedExercises[idx].id !== exercise.id) {
                isChanged = true;
            }
        });

        return isChanged;
    })
    function arraymove(arr: Array<unknown>, fromIndex: number, toIndex: number) {
        var element = arr[fromIndex];
        arr.splice(fromIndex, 1);
        arr.splice(toIndex, 0, element);
    }

</script>

<PageHeader title="Reorder exercises" level={2} />
<form id="reorder-exercises" onsubmit={async (e) => {
    e.preventDefault();
    const promises: Promise<unknown>[] = [];
    orderedExercises.forEach((exercise, idx) => {
        promises.push(updatePosition(data.workout.id, exercise.id, idx + 1));
    });
    await Promise.all(promises).then(() => {
        goto(`/${data.workout.id}`);
    });
}}>
    <ul>
        {#each orderedExercises as exercise, idx (exercise.id)}
            <li animate:flip={{ duration: 300}}>
                {exercise.name}
                <div>
                    <Button 
                        rounded="full"
                        disabled={idx === 0} 
                        variant="outline"
                        type="button"
                        onclick={() => arraymove(orderedExercises, idx, idx - 1)}
                    >
                        <ChevronUp />
                    </Button>
                    <Button 
                        rounded="full"
                        variant="outline"
                        disabled={idx === orderedExercises.length - 1} 
                        type="button"
                        onclick={() => arraymove(orderedExercises, idx, idx + 1)}
                    >
                        <ChevronDown />
                    </Button>
                </div>
            </li>
        {/each}
    </ul>
</form>
<Navbar backHref="/">
    <Button form="reorder-exercises" --width="100%" rounded="full" disabled={!isChanged}>
        Save changes
    </Button>
</Navbar>

<style>
    form {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        padding: var(--size-2);
    }

    ul {
        display: flex;
        flex-direction: column;
        :not(:first-child) {
            border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
        }
    }

    li {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: var(--font-size-2);
        font-weight: var(--font-weight-7);
        padding: var(--size-4) 0;

        div {
            display: flex;
            gap: var(--size-2);
        }
    }
</style>