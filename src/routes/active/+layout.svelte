<script lang="ts">
  import { goto } from "$app/navigation";
  import { ActivityStore } from "$lib/stores";

  $effect.pre(() => {
    const activeWorkout = localStorage.getItem("activeHistoryId");

    if (!activeWorkout) {
      goto("/");
    } else {
      ActivityStore.currentId = activeWorkout;

      goto(`/active/${activeWorkout}`);
    }
  });

  let { children } = $props();
</script>

{@render children?.()}
