<script lang="ts">
  import { IconCircle, IconCircleCheckFilled } from "@tabler/icons-svelte";

  type Props = {
    options: { value: number; label: string }[];
    onAdd?: (value: number) => void;
    onRemove?: (value: number) => void;
    selected?: number[];
  };

  let { options, onAdd, onRemove, selected = $bindable([]) }: Props = $props();
</script>

<ul>
  {#each options as option}
    <li>
      {#if selected.includes(option.value)}
        <button
          onclick={() => {
            selected = selected.filter((value) => value !== option.value);
            onRemove?.(option.value);
          }}
        >
          <span>
            <IconCircleCheckFilled color="var(--primary)" />
          </span>
          {option.label}
        </button>
      {:else}
        <button
          onclick={() => {
            selected.push(option.value);
            onAdd?.(option.value);
          }}
        >
          <span>
            <IconCircle color="var(--primary)" />
          </span>
          {option.label}
        </button>
      {/if}
    </li>
  {/each}
</ul>

<style>
  li:not(:first-child) {
    border-top: 1px solid var(--border-color);
  }

  li {
    display: flex;
    list-style: none outside;

    button {
      display: flex;
      align-items: center;
      gap: var(--size-2);
      padding: var(--size-3) var(--size-2);
      width: 100%;
      color: var(--foreground);
    }
  }
</style>
