<script lang="ts">
    let { children } = $props();
</script>

<nav>
    <a href="/">Back</a>
</nav>

{@render children?.()}
