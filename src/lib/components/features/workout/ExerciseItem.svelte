<script lang="ts">
  import type { WeightUnit } from "$lib/db";
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLDivElement> & {
    name: string;
    sets: number;
    reps: number;
    weight: number;
    weightUnit: WeightUnit;
  };

  let { name, sets, reps, weight, weightUnit, ...props }: Props = $props();
</script>

<div class="flex w-full items-center gap-4 p-2" {...props}>
  <div
    class="border-accent flex size-14 flex-col items-center justify-center rounded border"
  >
    <span class="text-foreground font-semibold">{weight}</span>
    <span class="text-muted-foreground text-xs">{weightUnit}</span>
  </div>
  <div class="flex w-full flex-1 flex-col gap-2">
    <span class="text-lg font-bold">{name}</span>
    <span class="text-muted-foreground text-sm">{sets} sets, {reps} reps</span>
  </div>
</div>
