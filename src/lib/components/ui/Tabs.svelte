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
    if (currentValue) {
      onChange?.(currentValue);
    }
  });
</script>

{#snippet tab(label: string, value: T)}
  <button
    data-selected={currentValue === value}
    onclick={() => (currentValue = value)}
  >
    {label}
  </button>
{/snippet}

<div {...props}>
  {#each options as option}
    {@render tab(option.label, option.value)}
  {/each}
</div>

<style>
  div {
    display: flex;
    gap: var(--size-1);
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    padding: var(--size-1);
  }

  button {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: var(--size-3);
    border-radius: var(--radius-round);
    padding: var(--size-1) var(--size-2);
    width: 100%;
    color: hsl(var(--white-hsl) / 70%);
    font-weight: var(--font-weight-5);
    text-align: center;
  }

  button[data-selected="true"] {
    background-color: var(--secondary);
    color: var(--foreground);
    font-weight: var(--font-weight-7);
  }
</style>
