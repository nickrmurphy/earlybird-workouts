<script lang="ts">
  import { onMount } from "svelte";
  import { Drawer, Input } from "./ui";

  type Props = {
    onWeightChange: (weight: number) => void;
    onSetsChange: (sets: number) => void;
    onRepsChange: (reps: number) => void;
    defaultWeight: number;
    defaultSets: number;
    defaultReps: number;
    instructions?: string[];
    name: string;
    open: boolean;
    onOpenChange?: (open: boolean) => void;
  };

  let {
    onWeightChange,
    onSetsChange,
    onRepsChange,
    defaultWeight,
    defaultSets,
    defaultReps,
    instructions,
    name,
    open = $bindable(false),
    onOpenChange,
  }: Props = $props();
  let init = $state(false);

  $effect(() => {
    if (!init) return;
    onOpenChange?.(open);
  });

  onMount(() => {
    init = true;
  });
</script>

<Drawer bind:open title={name}>
  <div style="display: flex; gap: var(--size-4); flex-direction: column;">
    <label>
      <span>Weight (lbs)</span>
      <Input
        defaultValue={defaultWeight}
        type="number"
        step={0.5}
        inputmode="decimal"
        oninput={(e) => onWeightChange(parseInt(e.currentTarget.value))}
      />
    </label>
    <label>
      <span>Sets</span>
      <select
        value={defaultSets}
        onchange={(e) => onSetsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 10 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </select>
    </label>
    <label>
      <span>Reps</span>
      <select
        value={defaultReps}
        onchange={(e) => onRepsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 30 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </select>
    </label>
  </div>
  {#if instructions && instructions.length > 0}
    <details style="display: flex; flex-direction: column; gap: var(--size-2);">
      <summary style="color: var(--muted-foreground)">View instructions</summary
      >
      <ol
        style="margin-top: var(--size-4); line-height: var(--font-lineheight-3); color: var(--muted-foreground);"
      >
        {#each instructions as instruction, idx}
          <li>
            <span>{idx + 1}.</span>
            {instruction}
          </li>
        {/each}
      </ol>
    </details>
  {/if}
</Drawer>

<style>
  label {
    display: grid;
    gap: var(--size-2);
  }

  select {
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    background-color: transparent;
    padding: 12px 10px;
    color: var(--magnolia);
    font-weight: var(--font-weight);
    font-size: var(--font-size, var(--font-size-2));
  }

  select:focus {
    transition: all;
    outline: 2px solid var(--primary-color);
    outline-offset: 2px;
  }

  ol {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    padding: var(--size-2);

    li {
      font-size: var(--font-size-2);
      line-height: var(--font-lineheight-4);
      span {
        font-weight: var(--font-weight-7);
      }
    }
  }
</style>
