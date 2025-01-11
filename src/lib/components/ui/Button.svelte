<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  type Props = HTMLButtonAttributes & {
    rounded?: "default" | "full";
    variant?: "primary" | "ghost" | "outline";
    size?: "md" | "lg";
  };

  let {
    children,
    rounded = "default",
    variant = "primary",
    size = "md",
    ...props
  }: Props = $props();
</script>

<button
  {...props}
  data-variant={variant}
  data-size={size}
  data-rounded={rounded}
>
  {@render children?.()}
</button>

<style>
  button {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: var(--size-2);
    width: var(--width);
    font-weight: var(--font-weight-6);
    text-align: center;

    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }

  button[data-variant="primary"] {
    background-color: var(--yellow);
    color: hsla(var(--black-hsl) / 70%);
  }

  button[data-variant="ghost"] {
    background-color: transparent;
  }

  button[data-variant="outline"] {
    border: 1px solid var(--yellow);
    background-color: transparent;
    color: var(--yellow);
  }

  button[data-size="md"] {
    padding: var(--size-1) var(--size-2);

    min-width: 44px;
    min-height: 44px;
    font-size: var(--font-size-2);
  }

  button[data-size="lg"] {
    padding: var(--size-1) var(--size-2);
    font-size: var(--font-size-3);
  }

  button[data-rounded="rounded"] {
    border-radius: var(--radius-3);
    padding: var(--size-2) var(--size-3);
  }

  button[data-rounded="full"] {
    border-radius: var(--radius-round);
  }

  button:disabled {
    opacity: 0.5;
  }
</style>
