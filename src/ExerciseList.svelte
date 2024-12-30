<script lang="ts">
    import ExerciseItem from "./ExerciseItem.svelte";
    import type { Exercise } from "./types";

    type Props = {
        exercises: Exercise[];
    }

    let { exercises }: Props = $props();
</script>
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
</ul>

<style>
    li:not(:first-child) {
        border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
    }

    li {
        list-style: none outside;
        display: flex;
        align-items: center;
    }
</style>