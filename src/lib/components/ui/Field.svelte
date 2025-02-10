<script lang="ts">
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLDivElement>;
  let { children, ...props }: Props = $props();
</script>

<div {...props} class={[props.class, "grid gap-2"]}>{@render children?.()}</div>
