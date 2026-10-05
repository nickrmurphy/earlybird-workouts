import type { WeightUnit } from "$lib/db";
import { Field, Input, Select, type SelectProps } from "$lib/eb";
import { InstructionsList, Sheet, WeightUnitSelect } from "../../shared";

const range = (count: number): SelectProps["items"] =>
  Array.from({ length: count }, (_, idx) => ({
    label: String(idx + 1),
    value: String(idx + 1),
  }));

const setOptions = range(10);
const repOptions = range(30);

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  name: string;
  instructions?: string[];
  defaultWeight: number;
  defaultWeightUnit: WeightUnit;
  defaultSets: number;
  defaultReps: number;
  onWeightChange: (weight: number) => void;
  onWeightUnitChange: (unit: WeightUnit) => void;
  onSetsChange: (sets: number) => void;
  onRepsChange: (reps: number) => void;
};

export function ExerciseDrawer({
  open,
  onOpenChange,
  name,
  instructions,
  defaultWeight,
  defaultWeightUnit,
  defaultSets,
  defaultReps,
  onWeightChange,
  onWeightUnitChange,
  onSetsChange,
  onRepsChange,
}: Props) {
  return (
    <Sheet open={open} onOpenChange={onOpenChange} title={name}>
      <div className="flex items-end gap-3">
        <Field className="flex-1">
          <Field.Label>Weight</Field.Label>
          <Input
            type="number"
            min={0}
            step={0.5}
            inputMode="decimal"
            defaultValue={defaultWeight}
            onChange={(event) => {
              const weight = Number(event.currentTarget.value);
              if (!Number.isNaN(weight)) onWeightChange(weight);
            }}
          />
        </Field>
        <WeightUnitSelect
          className="w-28"
          label="Unit"
          value={defaultWeightUnit}
          onValueChange={onWeightUnitChange}
        />
      </div>
      <div className="grid grid-cols-2 gap-3">
        <Select
          label="Sets"
          items={setOptions}
          defaultValue={String(defaultSets)}
          onValueChange={(sets) => sets && onSetsChange(Number(sets))}
        />
        <Select
          label="Reps"
          items={repOptions}
          defaultValue={String(defaultReps)}
          onValueChange={(reps) => reps && onRepsChange(Number(reps))}
        />
      </div>
      {instructions && instructions.length > 0 && (
        <details className="group mt-2">
          <summary className="text-accent cursor-pointer font-semibold">
            Instructions
          </summary>
          <div className="pt-3">
            <InstructionsList instructions={instructions} />
          </div>
        </details>
      )}
    </Sheet>
  );
}
