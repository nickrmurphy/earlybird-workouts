<script lang="ts">
  import type { HTMLButtonAttributes } from "svelte/elements";

  let { children, ...props }: HTMLButtonAttributes = $props();
</script>

<button
  {...props}
  class={[
    props.class,
    "flex w-full min-w-[200px] items-center justify-between gap-2.5 px-3 py-2.5 text-sm font-medium tracking-wider uppercase [&>svg]:size-5",
  ]}
>
  {@render children?.()}
</button>
