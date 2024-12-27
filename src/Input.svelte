<script lang="ts">
    import type { HTMLInputAttributes } from 'svelte/elements';
    type Props = HTMLInputAttributes & {};

    let { children, ...props }: Props = $props();
</script>

<input {...props} />

<style>
    input {
        background-color: transparent;
        border-radius: var(--radius-2);
        padding: var(--size-1);
        font-size: var(--font-size-2);
    }
</style>