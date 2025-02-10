<script lang="ts">
  import type { HTMLSelectAttributes } from "svelte/elements";
  type Props = HTMLSelectAttributes & {};

  let { value = $bindable(), children, ...props }: Props = $props();
</script>

<select
  bind:value
  {...props}
  class={[
    props.class,
    "border-border focus-within:ring-accent focus-within:ring-offset-surface text-foreground rounded-sm border bg-transparent px-3 py-2 font-medium transition-all focus-within:ring-1 focus-within:outline-none disabled:opacity-50",
  ]}
>
  {@render children?.()}
</select>
