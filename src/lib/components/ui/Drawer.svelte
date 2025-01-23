<script lang="ts">
  import { IconX } from "@tabler/icons-svelte";
  import type { HTMLAttributes } from "svelte/elements";
  import { fade, fly } from "svelte/transition";
  type Props = HTMLAttributes<HTMLDivElement> & {
    open: boolean;
    title?: string;
  };
  let { open = $bindable(), title, children, ...props }: Props = $props();
</script>

{#if open}
  <div
    transition:fade={{ duration: 200 }}
    class="overlay"
    role="none"
    onclick={(e) => {
      e.stopPropagation();
      open = false;
    }}
  ></div>
  <div role="dialog" transition:fly={{ y: 1000, duration: 200 }} {...props}>
    <button onclick={() => (open = false)}>
      <IconX />
    </button>
    {#if title}
      <h2>{title}</h2>
    {/if}
    {@render children?.()}
  </div>
{/if}

<style>
  button {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 40px;
    height: 40px;
  }

  div[role="dialog"] {
    display: flex;
    position: fixed;
    right: 0;
    bottom: 0;
    left: 0;
    flex-direction: column;
    gap: var(--size-6);
    z-index: 99;
    border-top-right-radius: var(--radius-3);
    border-top-left-radius: var(--radius-3);
    background-color: var(--popover);
    padding-top: var(--size-2);
    padding-right: var(--size-2);
    padding-bottom: env(safe-area-inset-bottom);
    padding-left: var(--size-2);
    height: 75%;
    overflow-y: auto;
    color: var(--foreground);

    button {
      position: absolute;
      top: var(--size-2);
      right: var(--size-2);
    }

    h2 {
      position: sticky;
      top: 0;
      background-color: var(--popover);
      padding: var(--size-2);
      max-width: 85%;
      font-weight: var(--font-weight-6);
      font-size: var(--font-size-3);
    }
  }

  .overlay {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 98;
    background-color: hsl(var(--black-hsl) / 70%);
  }
</style>
