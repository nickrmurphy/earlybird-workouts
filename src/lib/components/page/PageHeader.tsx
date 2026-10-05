import { Display } from "$lib/eb";
import type { ReactNode } from "react";

type Props = {
  title?: string;
  /** Icon buttons shown beside the title */
  actions?: ReactNode;
  /** Shown below the title, e.g. search and filters */
  children?: ReactNode;
};

export function PageHeader({ title, actions, children }: Props) {
  return (
    <header className="bg-background/90 sticky top-0 z-10 -mx-4 flex flex-col gap-3 px-4 pt-[calc(var(--safe-top)+0.75rem)] pb-3 backdrop-blur-md">
      {(title || actions) && (
        <div className="flex items-center gap-2">
          {title && (
            // Title Case rather than Display's all caps
            <Display level={3} as="h1" className="min-w-0 flex-1 capitalize">
              {title}
            </Display>
          )}
          {actions && <div className="ml-auto flex items-center gap-1">{actions}</div>}
        </div>
      )}
      {children}
    </header>
  );
}
