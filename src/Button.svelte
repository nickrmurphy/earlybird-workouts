<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  const classes = {
    variant: {
      primary: "var-primary",
      ghost: "var-ghost",
      outline: "var-outline",
    },
    size: {
      md: "size-md",
      lg: "size-lg",
    },
    rounded: {
      full: "rounded-full",
      default: "rounded",
    },
  };

  type Props = HTMLButtonAttributes & {
    rounded?: keyof typeof classes.rounded;
    variant?: keyof typeof classes.variant;
    size?: keyof typeof classes.size;
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
  class={[
    classes.rounded[rounded],
    classes.variant[variant],
    classes.size[size],
    props.class,
  ]}
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

  .var-primary {
    background-color: var(--yellow);
    color: hsl(var(--raisin-black-hsl) / 90%);
  }

  .var-ghost {
    background-color: transparent;
  }

  .var-outline {
    border: 1px solid var(--yellow);
    background-color: transparent;
    color: var(--yellow);
  }

  .size-md {
    padding: var(--size-1) var(--size-2);

    min-width: 44px;
    min-height: 44px;
    font-size: var(--font-size-2);
  }

  .size-lg {
    padding: var(--size-1) var(--size-2);
    font-size: var(--font-size-3);
  }

  .rounded-full {
    justify-content: center;
    border-radius: var(--radius-round);
  }

  .rounded {
    border-radius: var(--radius-3);
    padding: var(--size-2) var(--size-3);
  }

  button:disabled {
    opacity: 0.5;
  }
</style>
