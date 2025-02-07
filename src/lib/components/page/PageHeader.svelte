<script lang="ts">
  import type { Snippet } from "svelte";
  import type { SvelteHTMLElements } from "svelte/elements";

  type Props = SvelteHTMLElements["HTMLHeadingElement"] & {
    title?: string | string[];
    level?: 1 | 2;
    right?: Snippet;
  };

  let { title, children, right }: Props = $props();
</script>

<header class="bg-background border-divide border-b shadow">
  {#if title || right}
    <div class="top-content">
      {#if title}
        <h1
          class="font-display text-foreground text-3xl font-bold tracking-wide"
        >
          {title}
        </h1>
      {/if}
      {#if right}
        <div class="right">{@render right()}</div>
      {/if}
    </div>
  {/if}
  {#if children}
    <div class="bottom-content">
      {@render children?.()}
    </div>
  {/if}
</header>

<style>
  header {
    position: sticky;
    top: 0;
    backdrop-filter: blur(10px);
    margin-right: var(--size-000);
    margin-left: var(--size-000);
    padding-top: calc(var(--safe-top) + var(--size-2));
    padding-right: var(--size-3);
    padding-bottom: var(--size-2);
    padding-left: var(--size-3);
  }

  .top-content {
    display: flex;
    align-items: baseline;
  }

  .bottom-content {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    width: 100%;
  }

  .right {
    display: flex;
    align-items: baseline;
    gap: var(--size-4);
    margin-left: auto;
  }
</style>
