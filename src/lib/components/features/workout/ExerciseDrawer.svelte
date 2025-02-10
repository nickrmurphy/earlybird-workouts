<script lang="ts">
  import { onMount } from "svelte";
  import { Drawer, Input, Select } from "../../ui";

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
      <span class="text-sm tracking-wide uppercase">Weight (lbs)</span>
      <Input
        defaultValue={defaultWeight}
        type="number"
        step={0.5}
        inputmode="decimal"
        oninput={(e) => onWeightChange(parseInt(e.currentTarget.value))}
      />
    </label>
    <label>
      <span class="text-sm tracking-wide uppercase">Sets</span>
      <Select
        value={defaultSets}
        onchange={(e) => onSetsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 10 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </Select>
    </label>
    <label>
      <span class="text-sm tracking-wide uppercase">Reps</span>
      <Select
        value={defaultReps}
        onchange={(e) => onRepsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 30 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </Select>
    </label>
  </div>
  {#if instructions && instructions.length > 0}
    <details style="display: flex; flex-direction: column; gap: var(--size-2);">
      <summary
        style="color: var(--color-muted-foreground)"
        class="text-sm tracking-wide uppercase">instructions</summary
      >
      <ol class="flex flex-col gap-2 p-2">
        {#each instructions as instruction, idx}
          <li class="">
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
