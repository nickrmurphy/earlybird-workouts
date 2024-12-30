<script lang="ts">
  import Button from "../../Button.svelte";
  import Dialog from "../../Dialog.svelte";
  import ExerciseItem from "../../ExerciseItem.svelte";
  import ExerciseList from "../../ExerciseList.svelte";
  import ExerciseSelectList from "../../ExerciseSelectList.svelte";
  import Heading from "../../Heading.svelte";
  import { ArrowLeft } from "../../icons";
  import PencilEdit from "../../icons/PencilEdit.svelte";
  import Input from "../../Input.svelte";

    const exercises = [
        {
            id: 1,
            name: "Squats",
            sets: 3,
            reps: 10,
            weight: 135
        },
        {
            id: 2,
            name: "Bench Press",
            sets: 3,
            reps: 10,
            weight: 135
        },
        {
            id: 3,
            name: "Deadlift",
            sets: 3,
            reps: 10,
            weight: 135
        }
    ];

    const exerciseOptions = Array.from({ length: 100}).map((_, i) => ({ value: i, label: `Exercise: ${i + 1}` }));
    let selectedOptions = $state([]);
</script>

<nav>
    <a href="/">
        <ArrowLeft />
        Back
    </a>
</nav>
<header>
    <Heading>Push</Heading>
</header>
<main>
    <section>
        <header>
            <Heading level={2}>Exercises</Heading>
            <Button variant="ghost" popovertarget="add-exercise">
                <PencilEdit />
            </Button>
        </header>
        <ExerciseList workoutId={12} exercises={exercises} />
    </section>
    <footer>
        <button>Start workout</button>
    </footer>
</main>

<Dialog id="add-exercise" popover="auto">
    {#snippet header()}
        <h2>
            Select exercises
            <span class="selected-count">{selectedOptions.length}</span>
        </h2>
        <Input />
    {/snippet}
    <ExerciseSelectList options={exerciseOptions} bind:selected={selectedOptions} />
    {#snippet actions()}
        <Button popovertargetaction="hide" popovertarget="add-exercise">
            Done
        </Button>
    {/snippet}
</Dialog>

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
        align-items: center;
        justify-content: center;
        
        button {
            display: flex;
            width: 90%;
            border-radius: var(--radius-3);
            font-weight: var(--font-weight-7);
            color: hsl(var(--raisin-black-hsl) / 90%);
            justify-content: center;
            background-color: var(--yellow);
            padding: var(--size-3) var(--size-2);
        }
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