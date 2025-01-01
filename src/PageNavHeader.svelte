<script lang="ts">
  import type { Snippet } from "svelte";
  import { ArrowLeft } from "./icons";
    type Props = {
        endContent?: Snippet;
        backHref?: string;
    };
    let { backHref, endContent }: Props = $props();
</script>
<nav>
    {#if backHref}
        <a href={backHref}>
            <ArrowLeft />
            Back
        </a>
    {/if}

    {#if endContent}
        <div>
            {@render endContent()}
        </div>
    {/if}
</nav>

<style>
    nav {
        padding: var(--size-3) var(--size-2);
        display: flex;
        justify-content: space-between;

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
</style>