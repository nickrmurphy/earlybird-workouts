<script lang="ts">
    import type { HTMLButtonAttributes } from 'svelte/elements';
    type Props = HTMLButtonAttributes & {
        rounded?: 'full' | 'default';
        variant?: 'primary' | 'ghost';
    };
    let { children, rounded = 'default', variant = 'primary', ...props }: Props = $props();
</script>

<button
    {...props}
    class={[
        rounded === 'full' ? 'rounded-full' : 'rounded',
        variant === 'ghost' && 'ghost',
        variant === 'primary' && 'primary',
    ]}
>
    {@render children?.()}
</button>

<style>
    button {
        padding: var(--size-1) var(--size-2);
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-2);
        display: flex;
        align-items: center;
    }

    .primary {
        background-color: var(--yellow);
        color: hsl(var(--raisin-black-hsl) / 90%);
    }

    .ghost {
        background-color: transparent;
        color: var(--magnolia);
    }

    .rounded-full {
        border-radius: var(--radius-round);
        height: var(--size-7);
        width: var(--size-7);
        justify-content: center;
    }

    .rounded {
        padding: var(--size-2) var(--size-3);
        border-radius: var(--radius-3);
    }

</style>
