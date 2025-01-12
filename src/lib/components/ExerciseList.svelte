<script lang="ts">
  import type { Exercise } from "$lib/types";
  import { Pressable, ExerciseItem } from "$lib/components";

  type Props = {
    exercises: Exercise[];
    workoutId: number;
  };

  let { exercises, workoutId }: Props = $props();
</script>

<ul>
  {#each exercises as exercise}
    <li>
      <Pressable style="width:100%" href={`/${workoutId}/${exercise.id}`}>
        <ExerciseItem
          name={exercise.name}
          weight={exercise.weight}
          sets={exercise.sets}
          reps={exercise.reps}
        />
      </Pressable>
    </li>
  {/each}
</ul>

<style>
  li:not(:first-child) {
    border-top: 1px solid var(--border-color);
  }

  li {
    display: flex;
    align-items: center;
    width: 100%;
    list-style: none outside;
  }
</style>
