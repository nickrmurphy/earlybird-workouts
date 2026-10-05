import type { WeightUnit } from "$lib/db";

type Props = {
  name: string;
  sets: number;
  reps: number;
  weight: number;
  weightUnit: WeightUnit;
  onClick?: () => void;
};

export function ExerciseItem({ name, sets, reps, weight, weightUnit, onClick }: Props) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="flex w-full cursor-pointer items-center gap-4 py-2 text-left"
    >
      <span className="border-accent flex size-14 shrink-0 flex-col items-center justify-center rounded-full border">
        <span className="font-semibold">{weight}</span>
        <span className="text-muted-foreground text-xs">{weightUnit}</span>
      </span>
      <span className="flex min-w-0 flex-1 flex-col gap-1">
        <span className="text-xl font-semibold">{name}</span>
        <span className="text-muted-foreground">
          {sets} sets, {reps} reps
        </span>
      </span>
    </button>
  );
}
