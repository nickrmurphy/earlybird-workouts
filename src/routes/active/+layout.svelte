<script lang="ts">
  import { goto } from "$app/navigation";
  import { ActivityStore } from "$lib/stores";

  $effect.pre(() => {
    const activeWorkout = parseInt(
      localStorage.getItem("activeHistoryId") ?? "",
    );

    if (!Number.isNaN(activeWorkout)) {
      goto("/");
    }

    ActivityStore.currentId = activeWorkout;

    goto(`/active/${activeWorkout}`);
  });

  let { children } = $props();
</script>

{@render children?.()}
