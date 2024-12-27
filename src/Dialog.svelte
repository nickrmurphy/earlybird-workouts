<script lang="ts">
    import type { Snippet } from 'svelte';
    import type { HTMLDialogAttributes } from 'svelte/elements';
    type Props = HTMLDialogAttributes & {
        actions?: Snippet;
    };

    let { children, actions, ...props }: Props = $props();
</script>

<dialog {...props}>

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
    }

    div {
        padding: var(--size-4);
        display: flex;
        flex-direction: column;
        gap: var(--size-4);
    }
</style>
