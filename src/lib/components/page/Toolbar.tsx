import type { ReactNode } from "react";

/** Bottom bar for a screen's main actions; back navigation lives in PageHeader */
export function Toolbar({ children }: { children: ReactNode }) {
  return (
    <div className="bg-background fixed inset-x-0 bottom-0 z-10 flex items-center gap-3 pt-2 pr-[calc(var(--safe-right)+0.5rem)] pb-[var(--safe-bottom)] pl-[calc(var(--safe-left)+0.5rem)]">
      {children}
    </div>
  );
}
