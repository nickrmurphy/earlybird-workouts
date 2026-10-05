import { weightUnitSchema, type WeightUnit } from "$lib/db";
import { Select, type SelectProps } from "$lib/eb";

const items: SelectProps["items"] = [
  { label: "lbs", value: "lbs" },
  { label: "kg", value: "kg" },
];

type Props = Omit<SelectProps, "items" | "value" | "onValueChange"> & {
  value: WeightUnit;
  onValueChange: (unit: WeightUnit) => void;
};

export function WeightUnitSelect({ value, onValueChange, ...props }: Props) {
  return (
    <Select
      {...props}
      items={items}
      value={value}
      onValueChange={(unit) => {
        if (unit) onValueChange(weightUnitSchema.parse(unit));
      }}
    />
  );
}
