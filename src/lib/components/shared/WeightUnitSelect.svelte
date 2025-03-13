<script lang="ts">
  import type { ComponentProps } from "svelte";
  import type { WeightUnit as IWeightUnit } from "$lib/database/database";
  import { Select } from "../ui";
  type Props = Omit<ComponentProps<typeof Select>, "value" | "onchange"> & {
    value: IWeightUnit;
    onchange: (unit: IWeightUnit) => void;
  };

  let { value = $bindable(), onchange, ...props }: Props = $props();
</script>

<Select
  bind:value
  onchange={(e) => {
    onchange?.(e.currentTarget.value as IWeightUnit);
  }}
  {...props}
>
  <option value="lb">lbs</option>
  <option value="kg">kg</option>
</Select>
