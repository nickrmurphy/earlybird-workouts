<script lang="ts">
  import { impactFeedback } from "@tauri-apps/plugin-haptics";
  import {
    IconCircle,
    IconCircleCheckFilled,
    IconInfoCircle,
  } from "@tabler/icons-svelte";

  type Props = {
    options: { id: string; name: string }[];
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
    selected.push(option.id);
    onAdd?.(option.id);
    impactFeedback("soft");
  }

  function handleRemove(option: Props["options"][0]) {
    selected = selected.filter((value) => value !== option.id);
    onRemove?.(option.id);
    impactFeedback("soft");
  }
</script>

<ul>
  {#each options as option (option.id)}
    <li>
      {#if selected.includes(option.id)}
        <button onclick={() => handleRemove(option)}>
          <span>
            <IconCircleCheckFilled color="var(--color-accent)" />
          </span>
          {option.name}
        </button>
      {:else}
        <button onclick={() => handleSelect(option)}>
          <span>
            <IconCircle color="var(--color-accent)" />
          </span>
          <span class="text-start">
            {option.name}
          </span>
        </button>
      {/if}
      <button
        style="margin-left: auto; width: fit-content; color: var(--color-muted-foreground)"
        onclick={() => onSelectInfo?.(option.id)}
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
