<script lang="ts">
    import "../reset.css";
    import "../main.css";
    import { onNavigate } from '$app/navigation'

    let { children } = $props();

	onNavigate((navigation) => {
		if (!document.startViewTransition) return

		return new Promise((resolve) => {
			document.startViewTransition(async () => {
				resolve()
				await navigation.complete
			})
		})
	})

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