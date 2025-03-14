<script lang="ts">
  import "../main.css";
  import { onNavigate } from "$app/navigation";
  import { Waves } from "$lib/assets";
  import { Button } from "$lib/components";
  import { IconArrowRight } from "@tabler/icons-svelte";
  import { fade } from "svelte/transition";
  import { onMount } from "svelte";

  let { children } = $props();

  // TODO: Implement a better way to handle this
  let welcomed = $state(localStorage.getItem("welcomed") === "true");
  let mounted = $state(false);

  onNavigate((navigation) => {
    if (!document.startViewTransition) return;

    return new Promise((resolve) => {
      document.startViewTransition(async () => {
        resolve();
        await navigation.complete;
      });
    });
  });

  onMount(() => {
    mounted = true;
  });
</script>

{#if welcomed}
  {#if mounted}
    <div in:fade={{ delay: 100, duration: 500 }}>
      {@render children?.()}
    </div>
  {/if}
{:else if mounted}
  <div
    in:fade={{ delay: 100, duration: 1000 }}
    out:fade={{ duration: 1000 }}
    class="flex h-screen flex-col items-center justify-center"
  >
    <div class="fixed inset-x-0 bottom-0 h-[42.8%] rotate-180 overflow-clip">
      <Waves />
    </div>
    <div class="fixed inset-x-10">
      <Button
        onclick={() => {
          welcomed = true;
          localStorage.setItem("welcomed", "true");
        }}
      >
        Get Started
        <IconArrowRight />
      </Button>
    </div>
    <div class="mb-[70%] grid gap-4">
      <h1 class="font-display z-50 text-6xl font-bold text-white">Workouts</h1>
      <p class="font-display z-50 px-2 text-2xl font-semibold text-white/95">
        by Early Bird
      </p>
    </div>
  </div>
{/if}
