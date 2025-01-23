<script lang="ts">
  import {
    IconCircle,
    IconCircleCheckFilled,
    IconInfoCircle,
  } from "@tabler/icons-svelte";
  import { Button, Drawer } from "./ui";

  type Props = {
    options: { value: number; label: string; description: string }[];
    onAdd?: (value: number) => void;
    onRemove?: (value: number) => void;
    selected?: number[];
  };

  let { options, onAdd, onRemove, selected = $bindable([]) }: Props = $props();

  let focusedExercise = $state<{
    label: string;
    value: number;
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
  }

  function handleRemove(option: Props["options"][0]) {
    selected = selected.filter((value) => value !== option.value);
    onRemove?.(option.value);
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
        <button onclick={() => handleRemove(option)}>
          <span>
            <IconCircle color="var(--primary)" />
          </span>
          {option.label}
        </button>
      {/if}
      <button
        style="margin-left: auto; width: fit-content; color: var(--muted-foreground)"
        onclick={() => (focusedExercise = option)}
      >
        <IconInfoCircle />
      </button>
    </li>
  {/each}
</ul>
<Drawer bind:open={showDrawer} title={focusedExercise?.label}>
  <p>{focusedExercise?.description}</p>
  <div style="margin-top: auto; margin-bottom: env(safe-area-inset-bottom)">
    {#if focusedExercise && selected.includes(focusedExercise.value)}
      <Button
        variant="outline"
        style="width: 100%"
        onclick={() => {
          handleRemove(focusedExercise!);
          showDrawer = false;
        }}
      >
        Remove
      </Button>
    {:else}
      <Button
        variant="outline"
        style="width: 100%"
        onclick={() => {
          handleSelect(focusedExercise!);
          showDrawer = false;
        }}
      >
        Select
      </Button>
    {/if}
  </div>
</Drawer>

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

  p {
    padding: var(--size-2);
    line-height: var(--font-lineheight-4);
  }
</style>
