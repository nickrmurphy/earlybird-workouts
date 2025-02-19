<script lang="ts">
  import { Drawer, Field, Label, WeightUnitSelect } from "$lib/components";
  import { getDefaultWeightUnit, setDefaultWeightUnit } from "$lib/utils";
  import type { ComponentProps } from "svelte";
  type Props = Omit<ComponentProps<typeof Drawer>, "title">;

  let { open = $bindable(), ...props }: Props = $props();

  let defaultUnit = $state(getDefaultWeightUnit());
</script>

<Drawer bind:open title="Settings" {...props}>
  <Field>
    <Label for="defaultUnit">Default weight unit</Label>
    <WeightUnitSelect
      value={defaultUnit}
      onchange={(value) => {
        setDefaultWeightUnit(value);
        defaultUnit = value;
      }}
    />
  </Field>
</Drawer>
