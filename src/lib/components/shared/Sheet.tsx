import { Drawer } from "$lib/eb";
import type { ReactNode } from "react";

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  title: ReactNode;
  description?: ReactNode;
  /** Pinned below the scrolling content, e.g. a primary action */
  footer?: ReactNode;
  className?: string;
  children?: ReactNode;
};

/** EB bottom drawer with the app's safe-area padding. */
export function Sheet({
  open,
  onOpenChange,
  title,
  description,
  footer,
  className,
  children,
}: Props) {
  return (
    <Drawer side="bottom" open={open} onOpenChange={onOpenChange}>
      <Drawer.Content
        className={["pb-[calc(var(--safe-bottom)+2rem)]", className].filter(Boolean).join(" ")}
      >
        <Drawer.Title>{title}</Drawer.Title>
        {description && <Drawer.Description>{description}</Drawer.Description>}
        {children}
        {footer && (
          <div className="bg-background sticky -bottom-[calc(var(--safe-bottom)+2rem)] -mx-8 -mb-[calc(var(--safe-bottom)+2rem)] flex gap-3 px-8 pt-4 pb-[calc(var(--safe-bottom)+2rem)]">
            {footer}
          </div>
        )}
      </Drawer.Content>
    </Drawer>
  );
}
