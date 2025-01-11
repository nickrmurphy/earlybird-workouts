<script lang="ts">
  import ChevronDown from "../../icons/ChevronDown.svelte";
  import ChevronUp from "../../icons/ChevronUp.svelte";

  type Props = {
    exercises: {
      id: number;
      name: string;
      position: number;
    }[];
    onReorder: (exerciseId: number, newPosition: number) => void;
  };

  let { exercises, onReorder }: Props = $props();
</script>

<ul>
  {#each exercises as exercise, idx}
    <li>
      <h3>{exercise.name}</h3>
      <div>
        <button
          disabled={idx === 0}
          onclick={() => onReorder(exercise.id, exercise.position - 1)}
          ><ChevronUp /></button
        >
        <button
          disabled={idx === exercises.length - 1}
          onclick={() => onReorder(exercise.id, exercise.position + 1)}
          ><ChevronDown /></button
        >
      </div>
    </li>
  {/each}
</ul>

<style>
  ul {
    display: grid;
    gap: var(--size-4);
  }

  h3 {
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-3);
  }

  li {
    display: flex;
    justify-content: space-between;
    align-items: center;

    div {
      display: flex;
      gap: var(--size-3);
    }
  }

  button {
    display: flex;
    justify-content: center;
    align-items: center;

    border: 1px solid hsl(var(--magnolia-hsl) / 50%);
    border-radius: var(--radius-3);
    min-width: 44px;
    min-height: 44px;

    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }

  button:disabled {
    opacity: 0.5;
  }
</style>
