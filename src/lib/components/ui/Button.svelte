<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  type Props = HTMLButtonAttributes & {
    variant?: "primary" | "ghost" | "outline";
    size?: "md" | "sm";
  };

  let {
    children,
    variant = "primary",
    size = "md",
    ...props
  }: Props = $props();
</script>

<button
  {...props}
  data-variant={variant}
  data-size={size}
  class={[
    props.class,
    "flex min-h-11 w-full min-w-11 items-center justify-center gap-2 rounded-sm px-3 py-2 font-semibold disabled:opacity-50 [&>svg]:size-4",
    "data-[size=sm]:min-h-9 data-[size=sm]:px-2 data-[size=sm]:py-1 data-[size=sm]:text-sm",
    "data-[variant=primary]:bg-primary data-[variant=primary]:text-primary-foreground",
    "data-[variant=ghost]:text-foreground data-[variant=ghost]:bg-transparent",
    "data-[variant=outline]:border-muted-foreground data-[variant=outline]:text-muted-foreground data-[variant=outline]:border",
  ]}
>
  {@render children?.()}
</button>
