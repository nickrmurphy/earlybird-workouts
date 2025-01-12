<script lang="ts">
  import { goto } from "$app/navigation";
  import type { HTMLButtonAttributes } from "svelte/elements";

  const classes = {
    variant: {
      primary: "var-primary",
      destructive: "var-destructive",
    },
  };
  type WithRoutingProps = {
    href?: string;
    onclick?: never;
  };

  type WithClickProps = {
    href?: never;
    onclick: HTMLButtonAttributes["onclick"];
  };

  type Props = Omit<HTMLButtonAttributes, "onclick"> & {
    variant?: keyof typeof classes.variant;
  } & (WithRoutingProps | WithClickProps);
  let {
    children,
    variant = "primary",
    href,
    onclick,
    ...props
  }: Props = $props();
</script>

<button
  {...props}
  onclick={(e) => {
    if (href) {
      e.preventDefault();
      goto(href);
    } else {
      onclick?.(e);
    }
  }}
  class={[classes.variant[variant], props.class]}
>
  {@render children?.()}
</button>

<style>
  button {
    display: flex;
    justify-content: var(--justify-content, center);
    align-items: center;
    padding: var(--size-4);
    width: 100%;
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-2);
    text-align: center;

    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }

  button:disabled {
    opacity: 0.5;
  }

  .var-destructive {
    color: var(--rust);
  }
</style>
