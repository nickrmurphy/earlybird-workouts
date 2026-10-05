import { Card } from "$lib/eb";
import {
  CheckCircleIcon,
  CircleIcon,
  MinusCircleIcon,
} from "@phosphor-icons/react";

type Props = {
  exerciseName: string;
  setCount: number;
  completeSets: number;
};

export function ActiveExerciseCard({
  exerciseName,
  setCount,
  completeSets,
}: Props) {
  const isComplete = setCount > 0 && completeSets === setCount;

  return (
    <Card className="flex-row items-center">
      <span className="shrink-0 pl-5">
        {isComplete ? (
          <CheckCircleIcon weight="fill" className="text-accent" />
        ) : completeSets > 0 ? (
          <MinusCircleIcon className="text-accent" />
        ) : (
          <CircleIcon className="text-muted-foreground" />
        )}
      </span>
      <Card.Header className="flex-1 pb-5">
        <Card.Title>{exerciseName}</Card.Title>
        <span className="text-muted-foreground">
          {completeSets} of {setCount} {setCount === 1 ? "set" : "sets"}
        </span>
      </Card.Header>
    </Card>
  );
}
