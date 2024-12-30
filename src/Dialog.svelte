<script lang="ts">
    import type { Snippet } from 'svelte';
    import type { HTMLDialogAttributes } from 'svelte/elements';
    type Props = HTMLDialogAttributes & {
        actions?: Snippet;
        header?: Snippet;
    };

    let { children, actions, header, ...props }: Props = $props();
</script>

<dialog {...props}>
    {#if header}
        <header>
            {@render header()}
        </header>
    {/if}

    {#if children}
        <div>
            {@render children?.()}    
        </div>
    {/if}

    {#if actions}
        <footer>
            {@render actions()}
        </footer>
    {/if}
</dialog>

<style>
    dialog {
        background-color: var(--raisin-black);
        border-radius: var(--radius-3);
        border: none;
        color: var(--magnolia);
        width: 100%;
        max-width: var(--max-width, var(--size-xs));
        padding: var(--padding, 0);
        max-height: calc(100vh - env(safe-area-inset-top) - env(safe-area-inset-bottom) - var(--size-4));
        /* display: flex;
        flex-direction: column; */
    }

    dialog::backdrop {
        background-color: black;
        opacity: 0.7;
        transition: all 0.3s;
    }

    footer {
        display: flex;
        justify-content: flex-end;
        gap: var(--size-2);
        padding: var(--size-2);
        bottom: 0;
        position: sticky;
        position: -webkit-sticky; /* for Safari */
        gap: var(--size-3);
        display: flex;
        flex-direction: column;
        background-color: var(--raisin-black);
    }

    div {
        padding: var(--size-4);
        display: flex;
        flex-direction: column;
        gap: var(--size-4);
    }

    header {
        padding: var(--size-4);
        font-size: var(--font-size-3);
        font-weight: var(--font-weight-6);
        position: sticky;
        position: -webkit-sticky; /* for Safari */
        top: 0;
        align-self: flex-start;
        gap: var(--size-3);
        display: flex;
        flex-direction: column;
        background-color: var(--raisin-black);
    }
</style>
