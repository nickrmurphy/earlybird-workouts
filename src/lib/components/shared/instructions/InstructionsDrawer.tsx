import type { ReactNode } from "react";
import { Sheet } from "../Sheet";
import { InstructionsList } from "./InstructionsList";

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  name: string;
  instructions: string[];
  footer?: ReactNode;
};

export function InstructionsDrawer({ name, instructions, ...props }: Props) {
  return (
    <Sheet {...props} title={name}>
      <InstructionsList instructions={instructions} />
    </Sheet>
  );
}
