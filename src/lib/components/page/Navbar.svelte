<script lang="ts">
  import type { SvelteHTMLElements } from "svelte/elements";
  import { goto } from "$app/navigation";
  import { IconArrowLeft, IconCheck } from "@tabler/icons-svelte";

  type Props = SvelteHTMLElements["nav"] & {
    backHref?: string;
    backAsComplete?: boolean;
  };

  let { children, backHref, backAsComplete = false }: Props = $props();
</script>

{#snippet backButton(href: string, asComplete?: boolean)}
  <button
    class="border-muted-foreground text-muted-foreground flex size-11 min-h-11 min-w-11 items-center justify-center rounded border"
    onclick={() => goto(href)}
    style={asComplete
      ? "background-color: var(--color-primary); color: var(--color-primary-foreground)"
      : ""}
  >
    {#if asComplete}
      <IconCheck />
    {:else}
      <IconArrowLeft />
    {/if}
  </button>
{/snippet}

<nav
  class="bg-surface inset-x-0 bottom-0 rounded border-t border-white/10 shadow"
>
  {#if backHref}
    {@render backButton(backHref, backAsComplete)}
  {/if}
  {@render children?.()}
</nav>

<style>
  nav {
    display: flex;
    position: fixed;
    align-items: center;
    gap: var(--size-3);
    z-index: var(--layer-3);
    padding-top: var(--size-2);
    padding-right: calc(var(--size-3) + env(safe-area-inset-right));
    padding-bottom: env(safe-area-inset-bottom);
    padding-left: calc(var(--size-3) + env(safe-area-inset-left));
  }

  :global(:root) {
    /* safe area + button height + padding-bottom + padding-top */
    --navbar-height: calc(env(safe-area-inset-bottom) + 44px + 5px + 5px);
  }
</style>
