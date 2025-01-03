<script lang="ts">
    import type { SvelteHTMLElements } from "svelte/elements";
    import Heading from "./Heading.svelte";
  import type { Snippet } from "svelte";

    type Props = SvelteHTMLElements["HTMLHeadingElement"] & {
        title?: string;
        level?: 1 | 2;
        control?: Snippet;
    };

    let {  level = 1, title, children, control }: Props = $props();

  </script>

<div class="unsafe"></div>
<header>
    {#if title}
        <Heading style="view-transition-name: page-heading" {level}>{title}</Heading>
    {/if}
    {@render children?.()}
    {#if control}
        <div class="control">
            {@render control()}
        </div>
    {/if}
</header>
  
<style>
    .unsafe {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: env(safe-area-inset-top);
        background-color: var(--raisin-black);
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: var(--size-2);

        position: sticky;
        top: env(safe-area-inset-top);
        left: var(--size-2);
        right: var(--size-2);
        background-color: var(--raisin-black);
    }

    .control {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        width: 100%;
    }
</style>