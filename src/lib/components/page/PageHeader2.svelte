<script lang="ts">
  import type { Snippet } from "svelte";
  import type { SvelteHTMLElements } from "svelte/elements";

  type Props = SvelteHTMLElements["HTMLHeadingElement"] & {
    title?: string | string[];
    level?: 1 | 2;
    right?: Snippet;
  };

  let { level = 1, title, children, right }: Props = $props();
</script>

<header>
  {#if title}
    <h1 data-level={level}>{title}</h1>
  {/if}
  {@render children?.()}
  {#if right}
    <div style="margin-left: auto;">{@render right()}</div>
  {/if}
</header>

<style>
  header {
    display: flex;
    position: sticky;
    top: 0;
    align-items: center;
    backdrop-filter: blur(10px);
    margin-right: var(--size-000);
    margin-left: var(--size-000);
    background-color: hsla(var(--background-hsl) / 90%);
    padding-top: calc(env(safe-area-inset-top) + var(--size-2));
    padding-right: var(--size-3);
    padding-bottom: var(--size-2);
    padding-left: var(--size-3);
  }

  h1[data-level="1"] {
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-4);
  }
</style>
