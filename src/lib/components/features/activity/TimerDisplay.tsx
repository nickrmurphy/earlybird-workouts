import { TimerIcon } from "@phosphor-icons/react";

const pad = (value: number) => String(value).padStart(2, "0");

type Props = {
  elapsedSeconds: number;
};

export function TimerDisplay({ elapsedSeconds }: Props) {
  const minutes = Math.floor(elapsedSeconds / 60);
  const seconds = elapsedSeconds % 60;

  return (
    <span
      className="flex items-center gap-1.5 font-semibold tabular-nums"
      aria-label="Workout time"
    >
      <TimerIcon size={16} />
      {pad(minutes)}:{pad(seconds)}
    </span>
  );
}
