<script lang="ts">
  import {
    CheckCircleIcon,
    CircleIcon,
    MinusCircleIcon,
  } from "phosphor-svelte";

  type Props = {
    exerciseName: string;
    setCount: number;
    completeSets: number;
    isComplete: boolean;
  };

  let { exerciseName, setCount, isComplete, completeSets }: Props = $props();
</script>

<div class="border-border flex items-center gap-4 rounded-sm border p-2">
  <div>
    {#if isComplete}
      <CheckCircleIcon color="var(--color-accent)" />
    {:else if completeSets > 0}
      <MinusCircleIcon color="var(--color-accent)" />
    {:else}
      <CircleIcon class="text-muted-foreground" />
    {/if}
  </div>
  <div class="grid gap-2">
    <h3 class="text-lg font-bold">{exerciseName}</h3>
    <p class="text-muted-foreground text-sm">
      {completeSets} / {setCount} sets
    </p>
  </div>
</div>

<style>
</style>
