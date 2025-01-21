<script lang="ts">
  import { Button } from "./ui";
  import { IconCheck } from "@tabler/icons-svelte";

  type Props = {
    setId: number;
    reps: number;
    weight: number;
    isComplete: boolean;
    onToggleComplete?: (isComplete: boolean) => void;
    onRepsChange?: (reps: number) => void;
    onWeightChange?: (weight: number) => void;
  };

  let {
    reps,
    weight,
    isComplete,
    setId,
    onRepsChange,
    onToggleComplete,
    onWeightChange,
  }: Props = $props();
</script>

<div>
  <section>
    <label for={`reps-${setId}`}> Reps </label>
    <input
      id={`reps-${setId}`}
      inputmode="numeric"
      min={0}
      disabled={isComplete}
      type="number"
      defaultValue={reps}
      onchange={(e) => onRepsChange?.(Number(e.currentTarget.value))}
    />
  </section>

  <section>
    <label for={`weight-${setId}`}>
      Weight <span class="unit">(lbs)</span>
    </label>
    <input
      id={`weight-${setId}`}
      inputmode="numeric"
      min={0}
      disabled={isComplete}
      type="number"
      defaultValue={weight}
      onchange={(e) => onWeightChange?.(Number(e.currentTarget.value))}
    />
  </section>

  <section class="checkbox">
    <Button
      rounded="full"
      variant={isComplete ? "primary" : "outline"}
      onclick={() => onToggleComplete?.(!isComplete)}
    >
      {#if isComplete}
        <IconCheck />
      {/if}
    </Button>
  </section>
</div>

<style>
  div {
    display: grid;
    grid-template-columns: repeat(5, minmax(0, 1fr));
    gap: var(--size-2);
    margin: var(--size-2) 0;
  }

  label {
    display: flex;
    gap: var(--size-2);
    font-weight: var(--font-weight-5);
    .unit {
      color: hsl(var(--magnolia-hsl) / 70%);
    }
  }

  section {
    display: flex;
    grid-column: span 2 / span 2;
    flex-direction: column;
    gap: var(--size-2);
    margin: var(--size-2) 0;
  }

  section.checkbox {
    grid-column: span 1 / span 1;
    align-items: center;
    padding-top: var(--size-5);
  }

  input {
    display: flex;
    border: 1px solid var(--border-color);
    background-color: transparent;
    color: var(--magnolia);
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-3);
  }
</style>
