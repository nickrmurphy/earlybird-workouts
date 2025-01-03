<script lang="ts">
    import "../reset.css";
    import "../main.css";
    import { page } from "$app/state";
    let { children } = $props();
    
    ;
</script>

<!-- Top Padding -->
<div></div>
{@render children?.()}

<style>
    div {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: env(safe-area-inset-top);
        background-color: var(--raisin-black);
    }
</style>