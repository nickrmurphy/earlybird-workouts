<script lang="ts">
  import { impactFeedback } from "@tauri-apps/plugin-haptics";
  import {
    IconCircle,
    IconCircleCheckFilled,
    IconInfoCircle,
  } from "@tabler/icons-svelte";

  type Props = {
    options: { value: string; label: string }[];
    onAdd?: (value: string) => void;
    onRemove?: (value: string) => void;
    onSelectInfo?: (value: string) => void;
    selected?: string[];
  };

  let {
    options,
    onAdd,
    onRemove,
    onSelectInfo,
    selected = $bindable([]),
  }: Props = $props();

  function handleSelect(option: Props["options"][0]) {
    selected.push(option.value);
    onAdd?.(option.value);
    impactFeedback("soft");
  }

  function handleRemove(option: Props["options"][0]) {
    selected = selected.filter((value) => value !== option.value);
    onRemove?.(option.value);
    impactFeedback("soft");
  }
</script>

<ul>
  {#each options as option (option.value)}
    <li>
      {#if selected.includes(option.value)}
        <button onclick={() => handleRemove(option)}>
          <span>
            <IconCircleCheckFilled color="var(--color-accent)" />
          </span>
          {option.label}
        </button>
      {:else}
        <button onclick={() => handleSelect(option)}>
          <span>
            <IconCircle color="var(--color-accent)" />
          </span>
          <span class="text-start">
            {option.label}
          </span>
        </button>
      {/if}
      <button
        style="margin-left: auto; width: fit-content; color: var(--color-muted-foreground)"
        onclick={() => onSelectInfo?.(option.value)}
      >
        <IconInfoCircle />
      </button>
    </li>
  {/each}
</ul>

<style>
  li:not(:first-child) {
    border-top: 1px solid var(--color-divide);
  }
  ul {
    width: 100%;
  }
  li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    list-style: none outside;

    button {
      display: flex;
      align-items: center;
      gap: var(--size-3);
      padding: var(--size-3) var(--size-2);
      width: 100%;
      color: var(--color-foreground);
    }
  }
</style>
