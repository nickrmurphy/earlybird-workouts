<script lang="ts" generics="T">
  import type { HTMLAttributes } from "svelte/elements";

  interface Props extends HTMLAttributes<HTMLDivElement> {
    defaultValue?: T;
    onChange?: (value: T) => void;
    options: { label: string; value: T }[];
  }

  let { options, defaultValue, onChange, ...props }: Props = $props();
  let currentValue = $state(defaultValue);

  $effect(() => {
    if (currentValue !== undefined) {
      onChange?.(currentValue);
    }
  });
</script>

{#snippet tab(label: string, value: T)}
  <button
    data-selected={currentValue === value}
    class={[
      "text-muted-foreground flex w-full items-center justify-center rounded px-2 py-1 text-sm font-medium",
      "data-[selected=true]:bg-surface data-[selected=true]:text-foreground data-[selected=true]:font-bold",
    ]}
    onclick={() => (currentValue = value)}
  >
    {label}
  </button>
{/snippet}

<div
  {...props}
  class={[props.class, "border-border flex gap-1 rounded-sm border p-1"]}
>
  {#each options as option (option.value)}
    {@render tab(option.label, option.value)}
  {/each}
</div>
