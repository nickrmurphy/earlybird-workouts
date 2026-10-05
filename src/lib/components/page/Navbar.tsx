import { Button } from "$lib/eb";
import { ArrowLeftIcon, CheckIcon } from "@phosphor-icons/react";
import { useNavigate } from "@tanstack/react-router";
import type { ReactNode } from "react";

type Props = {
  /** Where the back button goes; no back button when omitted */
  backHref?: string;
  /** Show the back button as a primary "done" check */
  backAsComplete?: boolean;
  children?: ReactNode;
};

export function Navbar({ backHref, backAsComplete = false, children }: Props) {
  const navigate = useNavigate();

  return (
    <nav className="border-muted bg-background fixed inset-x-0 bottom-0 z-10 flex items-center gap-3 border-t pt-2 pr-[calc(var(--safe-right)+0.5rem)] pb-[var(--safe-bottom)] pl-[calc(var(--safe-left)+0.5rem)]">
      {backHref && (
        <Button
          iconOnly
          variant={backAsComplete ? "primary" : "secondary"}
          aria-label={backAsComplete ? "Done" : "Back"}
          onClick={() => navigate({ href: backHref })}
        >
          {backAsComplete ? <CheckIcon /> : <ArrowLeftIcon />}
        </Button>
      )}
      {children}
    </nav>
  );
}
