<script lang="ts">
  import { Button } from "$lib/components";
  import { IconPlayerPlay, IconPlayerStop } from "@tabler/icons-svelte";

  type Props = {
    width?: string;
    elapsedTime: number;
    runTimeSeconds: number;
    onclick?: () => void;
    isRunning?: boolean;
    isExpired?: boolean;
  };

  let {
    width = "100%",
    elapsedTime,
    runTimeSeconds,
    onclick,
    isRunning,
    isExpired,
  }: Props = $props();

  let formattedElapsedTime = $derived.by(() => {
    if (elapsedTime < 10) {
      return `0${elapsedTime}`;
    } else {
      return elapsedTime.toString();
    }
  });
</script>

<Button
  class="timer-btn"
  --width={width}
  rounded="full"
  variant="outline"
  {onclick}
>
  {#if isRunning}
    <IconPlayerStop />
  {:else}
    <IconPlayerPlay />
  {/if}
  <time data-expired={isExpired}>
    {formattedElapsedTime}/{runTimeSeconds} s.</time
  >
</Button>

<style>
  time {
    font-size: var(--font-size-0);
  }

  time[data-expired="true"] {
    color: var(--rust);
  }
</style>
