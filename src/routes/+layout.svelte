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

<div>
	{@render children?.()}
</div>

<style>
	div {
		padding-top: env(safe-area-inset-top);
		padding-bottom: env(safe-area-inset-bottom);
		padding-right: env(safe-area-inset-right);
		padding-left: env(safe-area-inset-left);
	}
</style>