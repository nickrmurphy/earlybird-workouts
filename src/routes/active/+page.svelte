<script lang="ts">
    import Heading from '../../Heading.svelte';
    import Button from '../../Button.svelte';
</script>

<Heading>Active workout</Heading>
<footer>
    <Button --width="100%">
        End workout
    </Button>
</footer>

<style>
    footer {
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: var(--size-2);
        padding: var(--size-2);
        bottom: env(safe-area-inset-bottom);
        left: env(safe-area-inset-left);
        right: env(safe-area-inset-right);
    }
</style>