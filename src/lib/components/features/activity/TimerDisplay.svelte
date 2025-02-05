<script lang="ts">
  import { type Snippet } from "svelte";
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLDivElement> & {
    elapsedSeconds: number;
    icon?: Snippet;
  };

  let { elapsedSeconds, icon, ...props }: Props = $props();

  let minutes = $derived(Math.floor(elapsedSeconds / 60));
  let seconds = $derived(elapsedSeconds % 60);
</script>

<div
  {...props}
  class={["flex items-baseline justify-center gap-1 font-mono ", props.class]}
>
  <!-- text-lg font-semibold -->
  {#if icon}
    <span class="my-auto">
      {@render icon()}
    </span>
  {/if}
  <span>
    {minutes < 10 ? `0${minutes}` : minutes}
  </span>
  <span>:</span>
  <span>
    {seconds < 10 ? `0${seconds}` : seconds}
  </span>
</div>
