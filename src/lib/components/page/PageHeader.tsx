import { Button, Display } from "$lib/eb";
import { ArrowLeftIcon } from "@phosphor-icons/react";
import { useNavigate } from "@tanstack/react-router";
import type { ReactNode } from "react";

type Props = {
  title?: string;
  /** Pushed screens: a back button top-left, with the title on its own row below */
  backHref?: string;
  /** Icon buttons shown beside the title (or beside the back button) */
  actions?: ReactNode;
  /** Shown below the title, e.g. search and filters */
  children?: ReactNode;
};

export function PageHeader({ title, backHref, actions, children }: Props) {
  const navigate = useNavigate();

  const heading = title && (
    // Title Case rather than Display's all caps
    <Display level={3} as="h1" className="min-w-0 flex-1 capitalize">
      {title}
    </Display>
  );
  const actionGroup = actions && <div className="ml-auto flex items-center gap-1">{actions}</div>;

  return (
    <header className="bg-background/90 sticky top-0 z-10 -mx-4 flex flex-col gap-3 px-4 pt-[calc(var(--safe-top)+0.75rem)] pb-3 backdrop-blur-md">
      {backHref ? (
        <>
          <div className="-ml-2 flex items-center gap-2">
            <Button
              variant="ghost"
              iconOnly
              aria-label="Back"
              onClick={() => navigate({ href: backHref })}
            >
              <ArrowLeftIcon />
            </Button>
            {actionGroup}
          </div>
          {heading}
        </>
      ) : (
        (title || actions) && (
          <div className="flex items-center gap-2">
            {heading}
            {actionGroup}
          </div>
        )
      )}
      {children}
    </header>
  );
}
