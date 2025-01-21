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
  {#if title || right}
    <div class="top-content">
      {#if title}
        <h1 data-level={level}>{title}</h1>
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

  .top-content {
    display: flex;
    align-items: center;
  }

  .bottom-content {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    width: 100%;
  }

  .right {
    display: flex;
    align-items: center;
    gap: var(--size-4);
    margin-left: auto;
  }
</style>
