<script lang="ts">
  import { popover } from "$lib/actions";
  import { onMount } from "svelte";
  import type { HTMLMenuAttributes } from "svelte/elements";
  import { fade } from "svelte/transition";

  type Props = HTMLMenuAttributes & {
    anchor: HTMLElement;
    open?: boolean;
  };

  let { open = $bindable(false), anchor, children, ...props }: Props = $props();

  onMount(() => {
    anchor.addEventListener("click", () => {
      open = !open;
    });
  });
</script>

{#if open}
  <menu
    transition:fade={{ duration: 100 }}
    use:popover={{
      anchorElement: anchor,
      onClickOutside: () => (open = false),
    }}
    {...props}
  >
    {@render children?.()}
  </menu>
{/if}

<style>
  menu {
    display: flex;
    position: absolute;
    flex-direction: column;
    border-radius: var(--radius-3);
    background-color: var(--licorice);
  }
</style>
