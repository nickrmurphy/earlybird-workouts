<script lang="ts">
    import type { SvelteHTMLElements } from 'svelte/elements';
    import { ArrowLeft, More } from '../icons';
    import { goto } from '$app/navigation';
    import type { Snippet } from 'svelte';

    type Props = SvelteHTMLElements["nav"] & {
        backHref?: string;
        backLabel?: string;
        actions?: Snippet;
    };

    let { children, backHref, backLabel, actions }: Props = $props();
</script>

{#snippet backButton(href: string, backLabel?: string)}
    <button onclick={() => goto(href)}>
        <ArrowLeft />
        <!-- {backLabel} -->
    </button>
{/snippet}

<nav>
    {#if backHref}
        {@render backButton(backHref, backLabel)}
    {/if}
    {#if actions}
        <button>
            <More />
        </button>
    {/if}
    {@render children?.()}
</nav>

<style>
    nav {
        /* layout */
        display: flex;
        align-items: center;
        gap: var(--size-2);

        /* styling for background */
        padding: 5px;
        border-radius: var(--radius-round);
        background-color: hsl(var(--magnolia-hsl) / 10%);
        backdrop-filter: blur(8px);

        /* positioning */
        position: fixed;
        left: var(--size-2);
        right: var(--size-2);
        bottom: env(safe-area-inset-bottom);

        view-transition-name: nav-bar;
    }

    button {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: var(--size-2);
        border: 1px solid hsl(var(--magnolia-hsl) / 50%);
        border-radius: var(--radius-round);
        min-width: 44px;
        min-height: 44px;
        padding: var(--size-1) var(--size-2);
        
        :global(svg){
            width: var(--size-4);
            height: var(--size-4);
        }
    }

    :global(:root){
        /* safe area + button height + padding-bottom + padding-top */
        --navbar-height: calc(env(safe-area-inset-bottom) + 44px + 5px + 5px);
    }
</style>