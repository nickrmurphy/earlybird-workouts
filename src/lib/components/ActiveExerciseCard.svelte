<script lang="ts">
  import {
    IconCircle,
    IconCircleCheck,
    IconCircleMinus,
  } from "@tabler/icons-svelte";

  type Props = {
    exerciseName: string;
    setCount: number;
    completeSets: number;
    isComplete: boolean;
  };

  let { exerciseName, setCount, isComplete, completeSets }: Props = $props();
</script>

<div class="card">
  <div>
    {#if isComplete}
      <IconCircleCheck />
    {:else if completeSets > 0}
      <IconCircleMinus />
    {:else}
      <IconCircle />
    {/if}
  </div>
  <div class="container">
    <h3>{exerciseName}</h3>
    <p>{completeSets} / {setCount} sets</p>
  </div>
</div>

<style>
  .card {
    display: flex;
    gap: var(--size-2);
    border: 1px solid hsl(var(--yellow-hsl) / 20%);
    border-radius: var(--radius-3);
    background-color: hsl(var(--yellow-hsl) / 10%);
    padding: var(--size-2);
  }

  .card div:first-child {
    display: flex;
    align-items: center;

    :global(svg) {
      width: var(--size-5);
      height: var(--size-5);
    }
  }

  h3 {
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-3);
  }

  .container {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
  }
</style>
