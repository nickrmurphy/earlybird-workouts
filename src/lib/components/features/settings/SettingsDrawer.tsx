import { getDefaultWeightUnit, setDefaultWeightUnit } from "$lib/utils";
import { useState } from "react";
import { Sheet, WeightUnitSelect } from "../../shared";

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
};

export function SettingsDrawer({ open, onOpenChange }: Props) {
  const [defaultUnit, setDefaultUnit] = useState(getDefaultWeightUnit);

  return (
    <Sheet open={open} onOpenChange={onOpenChange} title="Settings">
      <WeightUnitSelect
        label="Default weight unit"
        value={defaultUnit}
        onValueChange={(unit) => {
          setDefaultWeightUnit(unit);
          setDefaultUnit(unit);
        }}
      />
    </Sheet>
  );
}
