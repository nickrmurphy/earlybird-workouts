<script lang="ts">
  import { IconX } from "@tabler/icons-svelte";
  import type { HTMLAttributes } from "svelte/elements";
  import { fade, fly } from "svelte/transition";
  import type { Snippet } from "svelte";

  type Props = HTMLAttributes<HTMLDivElement> & {
    open: boolean;
    title?: string;
    footer?: Snippet;
  };

  let {
    open = $bindable(),
    title,
    children,
    footer,
    ...props
  }: Props = $props();
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
  <div
    role="dialog"
    transition:fly={{ y: 1000, duration: 200 }}
    {...props}
    class={["rounded-t-sm", props.class]}
  >
    <header>
      {#if title}
        <h2 class="max-w-[85%] p-2 text-xl font-bold">{title}</h2>
      {/if}
      <button onclick={() => (open = false)}>
        <IconX />
      </button>
    </header>
    <section>
      {@render children?.()}
    </section>
    {#if footer}
      <footer>
        {@render footer()}
      </footer>
    {/if}
  </div>
{/if}

<style>
  div[role="dialog"] {
    display: flex;
    position: fixed;
    right: 0;
    bottom: 0;
    left: 0;
    flex-direction: column;
    gap: var(--size-2);
    z-index: var(--layer-5);
    background-color: var(--color-surface);
    height: 75%;
    overflow-y: auto;
    color: var(--color-foreground);

    header {
      display: flex;
      position: sticky;
      top: 0;
      background-color: var(--color-surface);
      padding: var(--size-2);

      button {
        display: flex;
        position: absolute;
        top: var(--size-2);
        right: var(--size-2);
        justify-content: center;
        align-items: center;
        width: 44px;
        height: 44px;
      }
    }
  }

  footer {
    display: flex;
    position: fixed;
    right: calc(env(safe-area-inset-right) + var(--size-2));
    bottom: 0px;
    left: calc(env(safe-area-inset-right) + var(--size-2));
    background-color: var(--color-surface);
    padding-bottom: calc(env(safe-area-inset-bottom) + var(--size-2));
  }

  section {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    padding: var(--size-2);
    padding-bottom: calc(env(safe-area-inset-bottom) + 44px);
  }

  .overlay {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    opacity: 0.7;
    z-index: var(--layer-4);
    background-color: black;
  }
</style>
