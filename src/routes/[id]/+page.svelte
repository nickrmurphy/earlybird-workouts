<script lang="ts">
  import ExerciseItem from "../../ExerciseItem.svelte";

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

<h1>Push</h1>
<main>
    <section>
        <label>
            Name
            <input type="text" placeholder="Workout Name" />
        </label>
    </section>
    <section>
        <header>
            <h2>Exercises</h2>
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
            <li>
                Add exercises
            </li>
        </ul>
    </section>
    <footer>
        <button>Save</button>
    </footer>
</main>

<style>
    footer {
        position: absolute;
        bottom: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    li:not(:first-child) {
        border-top: 1px solid black;
    }

    li {
        list-style: none outside;
        display: flex;
        align-items: center;
    }
</style>