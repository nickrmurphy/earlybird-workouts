<script lang="ts">
  import type { SvelteHTMLElements } from "svelte/elements";
  import { goto } from "$app/navigation";
  import type { Snippet } from "svelte";
  import NavbarActions from "./NavbarActions.svelte";
  import {
    IconArrowLeft,
    IconCheck,
    IconDots,
    IconX,
  } from "@tabler/icons-svelte";

  type Props = SvelteHTMLElements["nav"] & {
    backHref?: string;
    backAsComplete?: boolean;
    actions?: Snippet;
  };

  let { children, backHref, backAsComplete = false, actions }: Props = $props();
  let actionsOpen = $state(false);
</script>

{#snippet backButton(href: string, asComplete?: boolean)}
  <button
    onclick={() => goto(href)}
    style={asComplete
      ? "background-color: var(--primary); color: var(--primary-foreground)"
      : ""}
  >
    {#if asComplete}
      <IconCheck />
    {:else}
      <IconArrowLeft />
    {/if}
  </button>
{/snippet}

<nav>
  {#if backHref}
    {@render backButton(backHref, backAsComplete)}
  {/if}
  {#if actions}
    <button onclick={() => (actionsOpen = !actionsOpen)}>
      {#if actionsOpen}
        <IconX />
      {:else}
        <IconDots />
      {/if}
    </button>
    <NavbarActions bind:open={actionsOpen}>
      {@render actions()}
    </NavbarActions>
  {/if}
  {@render children?.()}
</nav>

<style>
  nav {
    display: flex;
    position: fixed;
    right: calc(8px + env(safe-area-inset-right));
    bottom: env(safe-area-inset-bottom);
    left: calc(8px + env(safe-area-inset-left));
    align-items: center;
    gap: var(--size-2);
    z-index: var(--layer-3);
    backdrop-filter: blur(8px);
    box-shadow: var(--shadow-6);
    border-radius: var(--radius-round);
    background-color: hsl(var(--white-hsl) / 5%);
    padding: 5px;
  }

  button {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: var(--size-2);
    border: 1px solid var(--border-color);
    border-radius: var(--radius-round);
    padding: var(--size-1) var(--size-2);
    min-width: 44px;
    min-height: 44px;

    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }

  :global(:root) {
    /* safe area + button height + padding-bottom + padding-top */
    --navbar-height: calc(env(safe-area-inset-bottom) + 44px + 5px + 5px);
  }
</style>
