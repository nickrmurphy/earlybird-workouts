<script lang="ts">
  import { goto } from "$app/navigation";
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLDivElement> & {
    href: string;
  };

  let { href, children, ...rest }: Props = $props();
</script>

<div tabindex={0} role="button" onclick={() => goto(href)} {...rest}>
  {@render children?.()}
</div>
