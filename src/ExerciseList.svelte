<script lang="ts">
    import ExerciseItem from "./ExerciseItem.svelte";
    import type { Exercise } from "./types";

    type Props = {
        exercises: Exercise[];
        workoutId: number;
    }

    let { exercises, workoutId }: Props = $props();
</script>
<ul>
    {#each exercises as exercise}
        <li>
            <a href={`/${workoutId}/${exercise.id}`}>
                <ExerciseItem 
                    name={exercise.name}
                    weight={exercise.weight}
                    sets={exercise.sets}
                    reps={exercise.reps}
                />
            </a>
        </li>
    {/each}
</ul>

<style>
    li:not(:first-child) {
        border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
    }

    li {
        width: 100%;
        list-style: none outside;
        display: flex;
        align-items: center;

        a {
            width: 100%;
            display: flex;
            align-items: center;
        }
    }
</style>