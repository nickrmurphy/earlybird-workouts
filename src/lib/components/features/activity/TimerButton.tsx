import { ToggleButton } from "$lib/eb";
import { activity, useRestTimer } from "$lib/state";
import { cx } from "$lib/utils";
import { PlayIcon, StopIcon } from "@phosphor-icons/react";

const pad = (value: number) => String(value).padStart(2, "0");

/** Rest timer toggle: accent fill while running, pulsing once rest is over. */
export function TimerButton() {
  const { elapsedTime, runTimeSeconds, isRunning, isExpired } = useRestTimer();

  return (
    <ToggleButton
      tone="accent"
      aria-label="Rest timer"
      pressed={isRunning}
      onPressedChange={() => activity.restTimer.toggle()}
      className={cx(
        "w-auto flex-1 gap-2 px-5 font-semibold tabular-nums",
        isRunning && isExpired && "animate-pulse",
      )}
    >
      {isRunning ? <StopIcon /> : <PlayIcon />}
      <span>
        {pad(elapsedTime)} / {runTimeSeconds}s
      </span>
    </ToggleButton>
  );
}
