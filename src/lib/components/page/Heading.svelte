<script lang="ts">
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLHeadingElement> & {
    level?: 1 | 2 | 3;
  };

  let { children, level = 1, ...props }: Props = $props();
</script>

{#if level === 1}
  <h1 {...props} class="font-display">
    {@render children?.()}
  </h1>
{:else if level === 2}
  <h2 {...props}>
    {@render children?.()}
  </h2>
{:else if level === 3}
  <h3 {...props}>
    {@render children?.()}
  </h3>
{/if}

<style>
  h1 {
    font-weight: var(--font-weight-8);
    font-size: var(--font-size-6);
  }

  h2 {
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-3);
  }

  h3 {
    font-weight: var(--font-weight-5);
    font-size: var(--font-size-2);
  }
</style>
