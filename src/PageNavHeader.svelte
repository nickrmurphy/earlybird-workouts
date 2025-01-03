<script lang="ts">
  import type { Snippet } from "svelte";
  import { ArrowLeft } from "./icons";
  import Heading from "./Heading.svelte";
  import type { SvelteHTMLElements } from "svelte/elements";
  type WithTitleProps = {
      title: string;
      level?: 1 | 2;
  }  
  type WithoutTitleProps = {
      title?: never;
      level?: never;
  }  
  type Props = SvelteHTMLElements["nav"] & {
      endContent?: Snippet;
      headerContent?: Snippet;
      backHref?: string;
      backLabel?: string;
  } & (WithTitleProps | WithoutTitleProps);  
  let { backHref, backLabel, level = 1, title, endContent, children, headerContent}: Props = $props();
</script>

<div class="container">
    <nav>
        {#if backHref}
            <a href={backHref}>
                <ArrowLeft />
                {backLabel || "Back"}
            </a>
        {/if}
    
        {#if endContent}
            <div>
                {@render endContent()}
            </div>
        {/if}
    </nav>
    <header>
        {#if title}
            <Heading style="view-transition-name: nav-heading" {level}>{title}</Heading>
        {/if}
        {#if headerContent}
            <div>
                {@render headerContent()}
            </div>
        {/if}
    </header>
    {@render children?.()}
</div>


<style>
    .container {
        padding-left: var(--size-2);
        padding-right: var(--size-2);
        display: grid;
        gap: var(--size-3);
        position: sticky;
        top: env(safe-area-inset-top);
        left: 0;
        right: 0;
        background-color: var(--raisin-black);
    }

    nav {
        display: flex;
        justify-content: space-between;
        /* view-transition-name: ; */

        a {
            display: flex;
            align-items: center;
            gap: var(--size-2);
            
            :global(svg) {
                height: var(--size-4);
                width: var(--size-4);
            }
        }
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>