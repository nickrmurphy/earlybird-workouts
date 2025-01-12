<script lang="ts">
  import type { SvelteHTMLElements } from "svelte/elements";
  import Heading from "./Heading.svelte";
  import type { Snippet } from "svelte";

  type Props = SvelteHTMLElements["HTMLHeadingElement"] & {
    title?: string | string[];
    level?: 1 | 2;
    control?: Snippet;
  };

  let { level = 1, title, children, control }: Props = $props();
</script>

<div class="unsafe"></div>
<header>
  {#if title}
    <Heading style="view-transition-name: page-heading" {level}>
      <span>
        {#if typeof title === "string"}
          {title}
        {:else}
          {#each title as t, idx}
            <span data-current={idx === title.length - 1}>{t}</span>
            {#if idx < title.length - 1}
              <span data-current={idx === title.length - 1}>/</span>
            {/if}
          {/each}
        {/if}
      </span>
    </Heading>
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
    right: 0;
    left: 0;
    background-color: var(--raisin-black);
    height: env(safe-area-inset-top);
  }

  header {
    display: flex;

    position: sticky;
    top: env(safe-area-inset-top);
    right: var(--size-2);
    left: var(--size-2);
    justify-content: space-between;
    align-items: center;
    background-color: var(--raisin-black);
    padding: var(--size-2);
  }

  .control {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    width: 100%;
  }

  span {
    display: flex;
    align-items: start;
    gap: var(--size-2);
  }

  span[data-current="false"] {
    color: hsl(var(--magnolia-hsl) / 60%);
  }
</style>
