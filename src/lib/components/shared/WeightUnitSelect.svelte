<script lang="ts">
  import type { ComponentProps } from "svelte";
  import { Select } from "../ui";
  import { weightUnitSchema, type WeightUnit } from "$lib/db";
  type Props = Omit<ComponentProps<typeof Select>, "value" | "onchange"> & {
    value: WeightUnit;
    onchange: (unit: WeightUnit) => void;
  };

  let { value = $bindable(), onchange, ...props }: Props = $props();
</script>

<Select
  bind:value
  onchange={(e) => {
    onchange?.(weightUnitSchema.parse(e.currentTarget.value));
  }}
  {...props}
>
  <option value="lbs">lbs</option>
  <option value="kg">kg</option>
</Select>
