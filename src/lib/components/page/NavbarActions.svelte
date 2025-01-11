<script lang="ts">
  import type { SvelteHTMLElements } from "svelte/elements";
  import { fly } from "svelte/transition";

  type Props = SvelteHTMLElements["div"] & {
    open?: boolean;
  };

  let { open = $bindable(), children }: Props = $props();
</script>

{#if open}
  <div transition:fly={{ y: 100, duration: 200 }}>
    {@render children?.()}
  </div>
{/if}

<style>
  div {
    position: absolute;
    right: env(safe-area-inset-right);
    bottom: var(--navbar-height);
    bottom: 133%;
    left: env(safe-area-inset-left);
    box-shadow: var(--shadow-6);
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);

    background-color: var(--raisin-black);

    :global(:first-child) {
      border-top-right-radius: var(--radius-3);
      border-top-left-radius: var(--radius-3);
    }

    :global(:last-child) {
      border-bottom-right-radius: var(--radius-3);
      border-bottom-left-radius: var(--radius-3);
    }

    :global(:not(:first-child)) {
      border-top: 1px solid var(--border-color);
    }
  }
</style>
