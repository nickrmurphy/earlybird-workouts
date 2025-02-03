<script lang="ts">
  import type { HTMLInputAttributes } from "svelte/elements";
  type Props = HTMLInputAttributes & {};

  let { value = $bindable(), ...props }: Props = $props();
</script>

<input
  bind:value
  {...props}
  class={[
    props.class,
    "border-border focus-within:ring-accent focus-within:ring-offset-surface text-foreground rounded-sm border px-3 py-2 font-medium transition-all focus-within:ring-1 focus-within:outline-none disabled:opacity-50",
  ]}
/>
