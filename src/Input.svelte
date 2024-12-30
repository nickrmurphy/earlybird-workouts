<script lang="ts">
    import type { HTMLInputAttributes } from 'svelte/elements';
    type Props = HTMLInputAttributes & {};

    let { children, value = $bindable(), ...props }: Props = $props();
</script>

<input bind:value={value} {...props} />

<style>
    input {
        background-color: transparent;
        border-radius: var(--radius-2);
        padding: var(--size-1);
        font-size: var(--font-size-2);
        color: var(--magnolia);
    }
</style>