import type { WeightUnit } from "$lib/db";
import { CheckCircleIcon, CircleIcon } from "@phosphor-icons/react";

type Props = {
  exerciseName: string;
  sets: {
    weight: number;
    weightUnit: WeightUnit;
    count: number;
    isSuccess: boolean;
  }[];
};

export function ExerciseSetsTable({ exerciseName, sets }: Props) {
  return (
    <section className="flex flex-col gap-3">
      <h2 className="text-xl font-semibold">{exerciseName}</h2>
      <div className="border-muted rounded-surface overflow-hidden border">
        <table className="w-full text-left tabular-nums">
          <thead className="text-muted-foreground border-muted border-b">
            <tr>
              <th className="px-4 py-3 font-semibold">Set</th>
              <th className="py-3 font-semibold">Weight</th>
              <th className="py-3 font-semibold">Reps</th>
              <th className="px-4 py-3 text-right font-semibold">Done</th>
            </tr>
          </thead>
          <tbody className="divide-muted divide-y">
            {sets.map((set, index) => (
              <tr key={index}>
                <td className="text-muted-foreground px-4 py-3">{index + 1}</td>
                <td className="py-3">
                  {set.weight} {set.weightUnit}
                </td>
                <td className="py-3">{set.count}</td>
                <td className="px-4 py-3">
                  <span className="flex justify-end">
                    {set.isSuccess ? (
                      <CheckCircleIcon
                        size={20}
                        weight="fill"
                        className="text-accent"
                        aria-label="Completed"
                      />
                    ) : (
                      <CircleIcon
                        size={20}
                        className="text-muted-foreground"
                        aria-label="Not completed"
                      />
                    )}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  );
}
