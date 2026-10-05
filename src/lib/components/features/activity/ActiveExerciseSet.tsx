import type { WeightUnit } from "$lib/db";
import { Field, Input, ToggleButton } from "$lib/eb";
import { CheckIcon } from "@phosphor-icons/react";

type Props = {
  setIndex: number;
  reps: number;
  weight: number;
  weightUnit: WeightUnit;
  isComplete: boolean;
  onToggleComplete: (isComplete: boolean) => void;
  onRepsChange: (reps: number) => void;
  onWeightChange: (weight: number) => void;
};

function numberHandler(onValue: (value: number) => void) {
  return (event: React.ChangeEvent<HTMLInputElement>) => {
    const { value } = event.currentTarget;
    if (value !== "" && !Number.isNaN(Number(value))) onValue(Number(value));
  };
}

export function ActiveExerciseSet({
  setIndex,
  reps,
  weight,
  weightUnit,
  isComplete,
  onToggleComplete,
  onRepsChange,
  onWeightChange,
}: Props) {
  const setNumber = setIndex + 1;

  return (
    <section className="flex items-end gap-3" aria-label={`Set ${setNumber}`}>
      <span className="text-muted-foreground w-5 shrink-0 pb-2.5 font-semibold tabular-nums">
        {setNumber}
      </span>
      <Field className="flex-1" disabled={isComplete}>
        <Field.Label>Reps</Field.Label>
        <Input
          type="number"
          inputMode="numeric"
          min={0}
          defaultValue={reps}
          onChange={numberHandler(onRepsChange)}
        />
      </Field>
      <Field className="flex-1" disabled={isComplete}>
        <Field.Label>Weight ({weightUnit})</Field.Label>
        <Input
          type="number"
          inputMode="decimal"
          min={0}
          step={0.5}
          defaultValue={weight}
          onChange={numberHandler(onWeightChange)}
        />
      </Field>
      <ToggleButton
        tone="primary"
        aria-label={`Set ${setNumber} complete`}
        pressed={isComplete}
        onPressedChange={onToggleComplete}
      >
        <CheckIcon />
      </ToggleButton>
    </section>
  );
}
