<script lang="ts">
  import { NavbarButton } from "$lib/components";
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

<NavbarButton
  class="flex-1"
  variant={isRunning ? "accent" : "secondary"}
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
</NavbarButton>

<style>
  time {
    font-size: var(--font-size-0);
  }

  time[data-expired="true"] {
    color: var(--color-red-500);
  }
</style>
