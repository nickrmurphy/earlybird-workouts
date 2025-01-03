<script lang="ts">
    import type { HTMLButtonAttributes } from 'svelte/elements';

    const classes = {
        variant: {
            primary: 'var-primary',
            ghost: 'var-ghost',
            outline: 'var-outline',
        },
        size: {
            md: 'size-md',
            lg: 'size-lg',
        },
        rounded: {
            full: 'rounded-full',
            default: 'rounded',
        }
    }

    type Props = HTMLButtonAttributes & {
        rounded?: keyof typeof classes.rounded;
        variant?: keyof typeof classes.variant;
        size?: keyof typeof classes.size;
    };
    let { children, rounded = 'default', variant = 'primary', size = "md", ...props }: Props = $props();
</script>

<button
    {...props}
    class={[
        classes.rounded[rounded],
        classes.variant[variant],
        classes.size[size],
        props.class
    ]}
>
    {@render children?.()}
</button>

<style>
    button {
        font-weight: var(--font-weight-6);
        display: flex;
        align-items: center;
        text-align: center;
        justify-content: center;
        width: var(--width);

        :global(svg) {
            height: var(--size-4);
            width: var(--size-4);
        }
    }

    .var-primary {
        background-color: var(--yellow);
        color: hsl(var(--raisin-black-hsl) / 90%);
    }

    .var-ghost {
        background-color: transparent;
        color: var(--magnolia);
    }

    .var-outline {
        background-color: transparent;
        color: var(--yellow);
        border: 1px solid var(--yellow);
    }

    .size-md {
        padding: var(--size-1) var(--size-2);
        font-size: var(--font-size-2);

        min-width: 44px;
        min-height: 44px;
    }

    .size-lg {
        padding: var(--size-1) var(--size-2);
        font-size: var(--font-size-3);
    }

    .rounded-full {
        border-radius: var(--radius-round);
        justify-content: center;
    }

    .rounded {
        padding: var(--size-2) var(--size-3);
        border-radius: var(--radius-3);
    }

    button:disabled {
        opacity: 0.5;
    }
</style>
