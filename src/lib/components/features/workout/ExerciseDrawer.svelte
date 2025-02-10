<script lang="ts">
  import { onMount } from "svelte";
  import { Drawer, Field, Input, Label, Select } from "../../ui";

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
    <Field>
      <Label for="weight">Weight (lbs)</Label>
      <Input
        id="weight"
        defaultValue={defaultWeight}
        type="number"
        step={0.5}
        inputmode="decimal"
        oninput={(e) => onWeightChange(parseInt(e.currentTarget.value))}
      />
    </Field>
    <Field>
      <Label for="sets">Sets</Label>
      <Select
        id="sets"
        value={defaultSets}
        onchange={(e) => onSetsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 10 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </Select>
    </Field>
    <Field>
      <Label>Reps</Label>
      <Select
        value={defaultReps}
        onchange={(e) => onRepsChange(parseInt(e.currentTarget.value))}
      >
        {#each { length: 30 }, idx}
          <option value={idx + 1}>{idx + 1}</option>
        {/each}
      </Select>
    </Field>
  </div>
  {#if instructions && instructions.length > 0}
    <details style="display: flex; flex-direction: column; gap: var(--size-2);">
      <summary
        style="color: var(--color-muted-foreground)"
        class="text-sm tracking-wide uppercase">instructions</summary
      >
      <ol class="flex flex-col gap-2 p-2">
        {#each instructions as instruction, idx}
          <li class="text-lg">
            <span>{idx + 1}.</span>
            {instruction}
          </li>
        {/each}
      </ol>
    </details>
  {/if}
</Drawer>
