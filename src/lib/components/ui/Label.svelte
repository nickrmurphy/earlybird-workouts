<script lang="ts">
  import type { HTMLLabelAttributes } from "svelte/elements";

  type Props = HTMLLabelAttributes;
  let { children, ...props }: Props = $props();
</script>

<label {...props} class={[props.class, "text-sm tracking-wide uppercase"]}>
  {@render children?.()}
</label>
