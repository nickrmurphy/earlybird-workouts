<script lang="ts">
  import ExerciseItem from "../../ExerciseItem.svelte";
  import Heading from "../../Heading.svelte";
  import { ArrowLeft } from "../../icons";

    const exercises = [
        {
            name: "Squats",
            sets: 3,
            reps: 10,
            weight: 135
        },
        {
            name: "Bench Press",
            sets: 3,
            reps: 10,
            weight: 135
        },
        {
            name: "Deadlift",
            sets: 3,
            reps: 10,
            weight: 135
        }
    ];
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
        </header>
        <ul>
            {#each exercises as exercise}
                <li>
                    <ExerciseItem 
                        name={exercise.name}
                        weight={exercise.weight}
                        sets={exercise.sets}
                        reps={exercise.reps}
                    />
                </li>
            {/each}
        
            <li class="add-exercise">
                Add exercises
            </li>
        </ul>
    </section>
    <footer>
        <button>Start workout</button>
    </footer>
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

    header, main, section {
        padding: var(--size-1) var(--size-2);
    }

    section {
        padding: var(--size-1) 0;
        header {
            padding: var(--size-3) var(--size-1);
        }
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

    li:not(:first-child) {
        border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
    }

    li {
        list-style: none outside;
        display: flex;
        align-items: center;
    }

    .add-exercise {
        display: flex;
        align-items: center;
        padding: var(--size-3) var(--size-2);
        font-weight: var(--font-weight-5);
        border-color: wheat;
        color: hsl(var(--yellow-hsl) / 90%);
    }

    
</style>