import { Button } from "$lib/eb";
import { CheckIcon, MinusIcon } from "@phosphor-icons/react";
import type { ComponentProps } from "react";
import { InstructionsDrawer } from "./InstructionsDrawer";

type Props = Omit<ComponentProps<typeof InstructionsDrawer>, "footer"> & {
  isSelected: boolean;
  exerciseId: string;
  onAddExercise: (id: string) => void;
  onRemoveExercise: (id: string) => void;
};

export function InstructionsDrawerSelect({
  isSelected,
  exerciseId,
  onAddExercise,
  onRemoveExercise,
  ...props
}: Props) {
  return (
    <InstructionsDrawer
      {...props}
      footer={
        <Button
          className="flex-1"
          variant={isSelected ? "secondary" : "primary"}
          icon={isSelected ? <MinusIcon /> : <CheckIcon />}
          onClick={() => {
            if (isSelected) {
              onRemoveExercise(exerciseId);
            } else {
              onAddExercise(exerciseId);
            }
            props.onOpenChange(false);
          }}
        >
          {isSelected ? "Remove exercise" : "Add exercise"}
        </Button>
      }
    />
  );
}
