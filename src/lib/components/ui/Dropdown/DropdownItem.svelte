<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  let { children, ...props }: HTMLButtonAttributes = $props();
</script>

<button {...props}>
  {@render children?.()}
</button>

<style>
  button {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: var(--size-2);
    box-shadow: var(--shadow-5);
    padding: var(--size-2) var(--size-3);
    width: 100%;
    min-width: 200px;
  }
</style>
