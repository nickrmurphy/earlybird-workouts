<script lang="ts">
  import type { SvelteHTMLElements } from "svelte/elements";
  import { ArrowLeft, More, XIcon } from "$lib/icons";
  import { goto } from "$app/navigation";
  import type { Snippet } from "svelte";
  import NavbarActions from "./NavbarActions.svelte";

  type Props = SvelteHTMLElements["nav"] & {
    backHref?: string;
    actions?: Snippet;
  };

  let { children, backHref, actions }: Props = $props();
  let actionsOpen = $state(false);
</script>

{#snippet backButton(href: string)}
  <button onclick={() => goto(href)}>
    <ArrowLeft />
  </button>
{/snippet}

<nav>
  {#if backHref}
    {@render backButton(backHref)}
  {/if}
  {#if actions}
    <button onclick={() => (actionsOpen = !actionsOpen)}>
      {#if actionsOpen}
        <XIcon />
      {:else}
        <More />
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
    /* layout */
    display: flex;

    /* positioning */
    position: fixed;
    right: var(--size-2);
    bottom: env(safe-area-inset-bottom);
    left: var(--size-2);
    align-items: center;
    gap: var(--size-2);
    backdrop-filter: blur(8px);
    box-shadow: var(--shadow-6);
    border-radius: var(--radius-round);
    background-color: hsl(var(--white-hsl) / 10%);

    /* styling for background */
    padding: 5px;

    view-transition-name: nav-bar;
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
