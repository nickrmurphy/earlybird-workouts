<script lang="ts">
    import type { HTMLButtonAttributes } from 'svelte/elements';

    const classes = { 
        variant: {
            primary: 'var-primary',
            destructive: 'var-destructive',
        }
    }
    type Props = HTMLButtonAttributes & {
        variant?: keyof typeof classes.variant;
    };
    let { children, variant = "primary", ...props }: Props = $props();
</script>

<button
    {...props}
    class={[
        classes.variant[variant],
        props.class
    ]}
>
    {@render children?.()}
</button>

<style>
    button {
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-2);
        display: flex;
        align-items: center;
        text-align: center;
        justify-content: center;
        width: 100%;
        padding: var(--size-4);

        :global(svg) {
            height: var(--size-4);
            width: var(--size-4);
        }
    }

    button:disabled {
        opacity: 0.5;
    }

    .var-destructive {
        color: red;
    }
</style>
