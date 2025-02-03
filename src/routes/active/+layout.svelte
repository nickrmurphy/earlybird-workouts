<script lang="ts">
  import { goto } from "$app/navigation";

  $effect.pre(() => {
    const activeWorkout = parseInt(
      localStorage.getItem("activeHistoryId") ?? "",
    );

    if (!Number.isNaN(activeWorkout)) {
      goto("/");
    }

    goto(`/active/${activeWorkout}`);
  });

  let { children } = $props();
</script>

{@render children?.()}
