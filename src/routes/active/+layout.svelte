<script lang="ts">
  import { goto } from "$app/navigation";
  import { globalState } from "$lib/state";

  $effect.pre(() => {
    const activeWorkout = globalState.activity.currentId;

    if (!activeWorkout) {
      goto("/");
    }
  });

  let { children } = $props();
</script>

{@render children?.()}
