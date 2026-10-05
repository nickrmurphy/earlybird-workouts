import { Card } from "$lib/eb";

const DISPLAY_COUNT = 3;

type Props = {
  workoutName: string;
  exercises: string[];
};

export function WorkoutCard({ workoutName, exercises }: Props) {
  const overflowCount = exercises.length - DISPLAY_COUNT;

  return (
    <Card>
      <Card.Header>
        <Card.Title>{workoutName}</Card.Title>
      </Card.Header>
      <Card.Content>
        <ul className="flex flex-col gap-2">
          {exercises.slice(0, DISPLAY_COUNT).map((exercise) => (
            <li key={exercise}>{exercise}</li>
          ))}
          {overflowCount > 0 && (
            <li className="flex items-center justify-between">
              <span>…</span>
              <span className="border-muted rounded-pill border px-2 py-0.5 text-xs font-semibold">
                +{overflowCount} more
              </span>
            </li>
          )}
        </ul>
      </Card.Content>
    </Card>
  );
}
