<script lang="ts">
  import type { WeightUnit } from "$lib/db";
  import { Button, Input } from "../../ui";
  import { IconCheck } from "@tabler/icons-svelte";

  type Props = {
    setIndex: number;
    reps: number;
    weight: number;
    isComplete: boolean;
    weightUnit: WeightUnit;
    onToggleComplete?: (isComplete: boolean) => void;
    onRepsChange?: (reps: number) => void;
    onWeightChange?: (weight: number) => void;
  };

  let {
    reps,
    weight,
    weightUnit,
    isComplete,
    setIndex,
    onRepsChange,
    onToggleComplete,
    onWeightChange,
  }: Props = $props();
</script>

<section class="grid grid-cols-8 gap-2 pr-2 pl-1">
  <div
    class="text-muted-foreground col-span-3 text-xs tracking-wider uppercase"
  >
    <label for={`reps-${setIndex}`}>Reps</label>
  </div>
  <div
    class="text-muted-foreground col-span-3 text-xs tracking-wider uppercase"
  >
    <label for={`weight-${setIndex}`}>
      Weight <span class="unit">({weightUnit})</span>
    </label>
  </div>
  <div class="col-span-2"></div>
  <Input
    class="col-span-3"
    id={`reps-${setIndex}`}
    inputmode="numeric"
    min={0}
    disabled={isComplete}
    type="number"
    defaultValue={reps}
    onchange={(e) => onRepsChange?.(Number(e.currentTarget.value))}
  />
  <Input
    class="col-span-4"
    id={`weight-${setIndex}`}
    inputmode="decimal"
    min={0}
    disabled={isComplete}
    type="number"
    defaultValue={weight}
    onchange={(e) => onWeightChange?.(Number(e.currentTarget.value))}
  />
  <Button
    class="col-span-1"
    variant={isComplete ? "primary" : "outline"}
    onclick={() => onToggleComplete?.(!isComplete)}
  >
    {#if isComplete}
      <IconCheck />
    {/if}
  </Button>
</section>
