<script lang="ts">
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLElement> & {};

  let { children, ...props }: Props = $props();
</script>

<main {...props}>
  {@render children?.()}
</main>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    padding-right: var(--size-2);
    padding-bottom: calc(var(--navbar-height) + var(--size-2));
    padding-left: var(--size-2);
  }
</style>
