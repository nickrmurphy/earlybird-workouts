<script lang="ts">
  import { goto } from "$app/navigation";
  import type { HTMLButtonAttributes } from "svelte/elements";

  type WithRoutingProps = {
    href?: string;
    onclick?: never;
  };

  type WithClickProps = {
    href?: never;
    onclick: HTMLButtonAttributes["onclick"];
  };

  type Props = Omit<HTMLButtonAttributes, "onclick"> & {
    variant?: "primary" | "destructive";
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
  data-variant={variant}
  class={props.class}
  onclick={(e) => {
    if (href) {
      e.preventDefault();
      goto(href);
    } else {
      onclick?.(e);
    }
  }}
>
  {@render children?.()}
</button>

<style>
  button {
    display: flex;
    justify-content: var(--justify-content, space-between);
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

  button[data-variant="primary"] {
    color: white;
  }

  button[data-variant="destructive"] {
    color: var(--rust);
  }
</style>
