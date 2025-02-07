<script lang="ts">
  import { goto } from "$app/navigation";
  import { GlobalStore } from "$lib/stores";

  $effect.pre(() => {
    const activeWorkout = GlobalStore.Activity.currentId;

    if (!activeWorkout) {
      goto("/");
    }
  });

  let { children } = $props();
</script>

{@render children?.()}
