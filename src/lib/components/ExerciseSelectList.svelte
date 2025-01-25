<script lang="ts">
  import { impactFeedback } from "@tauri-apps/plugin-haptics";
  import {
    IconCircle,
    IconCircleCheckFilled,
    IconInfoCircle,
  } from "@tabler/icons-svelte";
  import { Button, Drawer } from "./ui";

  type Props = {
    options: { value: string; label: string; description: string }[];
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

  let focusedExercise = $state<{
    label: string;
    value: string;
    description: string;
  } | null>(null);

  let showDrawer = $state(false);

  $effect(() => {
    if (focusedExercise) {
      showDrawer = true;
    } else {
      showDrawer = false;
    }
  });

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
  {#each options as option}
    <li>
      {#if selected.includes(option.value)}
        <button onclick={() => handleRemove(option)}>
          <span>
            <IconCircleCheckFilled color="var(--primary)" />
          </span>
          {option.label}
        </button>
      {:else}
        <button onclick={() => handleSelect(option)}>
          <span>
            <IconCircle color="var(--primary)" />
          </span>
          {option.label}
        </button>
      {/if}
      <button
        style="margin-left: auto; width: fit-content; color: var(--muted-foreground)"
        onclick={() => onSelectInfo?.(option.value)}
      >
        <IconInfoCircle />
      </button>
    </li>
  {/each}
</ul>

<style>
  li:not(:first-child) {
    border-top: 1px solid var(--border-color);
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
      gap: var(--size-2);
      padding: var(--size-3) var(--size-2);
      width: 100%;
      color: var(--foreground);
    }
  }
</style>
