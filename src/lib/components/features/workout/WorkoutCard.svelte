<script lang="ts">
  type Props = {
    workoutName: string;
    exercises: string[];
  };
  let { workoutName, exercises }: Props = $props();
  const DISPLAY_COUNT = 3;
  const overflowCount = $derived(exercises.length - DISPLAY_COUNT);
</script>

<section class="bg-surface flex flex-col gap-4 rounded-sm p-3 py-4 shadow">
  <h3 class="font-display text-foreground text-xl font-bold">
    {workoutName}
  </h3>
  <ul class="text-muted-foreground flex list-inside flex-col gap-2.5">
    {#each exercises.slice(0, DISPLAY_COUNT) as exercise}
      <li class="font-medium">
        {exercise}
      </li>
    {/each}
    {#if overflowCount > 0}
      <li class="flex justify-between">
        <span>. . .</span>
        <span class="rounded px-2 py-1 text-xs font-bold outline">
          + {overflowCount}
        </span>
      </li>
    {/if}
  </ul>
</section>
