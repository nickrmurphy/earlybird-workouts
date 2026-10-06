import { Button } from "$lib/eb";
import { haptic } from "$lib/utils";
import { CheckCircleIcon, CircleIcon, InfoIcon } from "@phosphor-icons/react";

type Option = { value: string; label: string };

type Props = {
  options: Option[];
  selected: string[];
  onAdd: (value: string) => void;
  onRemove: (value: string) => void;
  onSelectInfo: (value: string) => void;
};

export function ExerciseSelectList({ options, selected, onAdd, onRemove, onSelectInfo }: Props) {
  return (
    <ul className="divide-muted divide-y">
      {options.map((option) => {
        const isSelected = selected.includes(option.value);

        return (
          <li key={option.value} className="flex items-center gap-2">
            <button
              type="button"
              aria-pressed={isSelected}
              className="flex flex-1 cursor-pointer items-center gap-3 py-3 text-left text-base"
              onClick={() => {
                if (isSelected) {
                  onRemove(option.value);
                } else {
                  onAdd(option.value);
                }
                haptic();
              }}
            >
              {isSelected ? (
                <CheckCircleIcon weight="fill" className="text-accent shrink-0" />
              ) : (
                <CircleIcon className="text-muted-foreground shrink-0" />
              )}
              {option.label}
            </button>
            <Button
              variant="ghost"
              iconOnly
              aria-label={`About ${option.label}`}
              className="text-muted-foreground"
              onClick={() => onSelectInfo(option.value)}
            >
              <InfoIcon />
            </Button>
          </li>
        );
      })}
    </ul>
  );
}
