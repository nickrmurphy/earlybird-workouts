<script lang="ts">
  import type { HTMLInputAttributes } from "svelte/elements";
  type Props = HTMLInputAttributes & {};

  let { children, value = $bindable(), ...props }: Props = $props();
</script>

<input bind:value {...props} />

<style>
  input {
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    background-color: transparent;
    padding: var(--size-2);
    color: var(--magnolia);
    font-weight: var(--font-weight);
    font-size: var(--font-size, var(--font-size-2));
  }
</style>
