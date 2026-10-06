import { cx } from "$lib/utils";
import type { ComponentProps } from "react";

export function Page({ className, ...props }: ComponentProps<"main">) {
  return (
    <main
      {...props}
      className={cx(
        "flex flex-col gap-5 px-4 pb-[calc(var(--bottom-bar-height)+1.5rem)]",
        className,
      )}
    />
  );
}
