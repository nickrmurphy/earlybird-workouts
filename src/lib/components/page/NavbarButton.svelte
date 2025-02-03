<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  type Props = HTMLButtonAttributes & {
    variant?: "primary" | "secondary" | "accent";
  };

  let { children, variant = "primary", ...props }: Props = $props();
</script>

<button
  {...props}
  class={[
    props.class,
    "flex min-h-11 min-w-11 items-center justify-center gap-2.5 rounded font-semibold disabled:opacity-50 [&>svg]:size-5",
    variant === "primary" && "bg-primary text-primary-foreground",
    variant === "secondary" &&
      "border-muted-foreground text-muted-foreground border bg-transparent",
    variant === "accent" && "border-accent text-accent border",
  ]}
>
  {@render children?.()}
</button>
