<script lang="ts">
  import { onMount } from "svelte";
  import { Drawer, Field, Input, Label, Select } from "../../ui";
  import { type WeightUnit } from "$lib/db";
  import { WeightUnitSelect } from "$lib/components/shared";

  type Props = {
    onWeightChange: (weight: number) => void;
    onSetsChange: (sets: number) => void;
    onRepsChange: (reps: number) => void;
    onWeightUnitChange: (unit: WeightUnit) => void;
    defaultWeight: number;
    defaultSets: number;
    defaultReps: number;
    defaultWeightUnit: WeightUnit;
    instructions?: string[];
    name: string;
    open: boolean;
    onOpenChange?: (open: boolean) => void;
  };

  let {
    onWeightChange,
    onSetsChange,
    onRepsChange,
    onWeightUnitChange,
    defaultWeight,
    defaultWeightUnit,
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
  <div class="flex flex-col gap-4">
    <div class="flex w-full items-center gap-4">
      <Field class="w-3/4">
        <Label for="weight">Weight</Label>
        <Input
          id="weight"
          defaultValue={defaultWeight}
          type="number"
          step={0.5}
          inputmode="decimal"
          oninput={(e) => onWeightChange(parseInt(e.currentTarget.value))}
        />
      </Field>
      <Field class="w-1/4">
        <Label for="unit">Unit</Label>
        <WeightUnitSelect
          id="unit"
          value={defaultWeightUnit}
          onchange={(unit) => onWeightUnitChange(unit)}
        />
      </Field>
    </div>
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
        {#each instructions as instruction, idx (idx)}
          <li class="text-lg">
            <span>{idx + 1}.</span>
            {instruction}
          </li>
        {/each}
      </ol>
    </details>
  {/if}
</Drawer>
