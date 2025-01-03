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

{@render children?.()}
