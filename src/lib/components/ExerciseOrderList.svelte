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
    }

    let { exercises, onReorder }: Props = $props();
</script>

<ul>
    {#each exercises as exercise, idx}
        <li>
            <h3>{exercise.name}</h3>
            <div>
                <button disabled={idx === 0} onclick={() => onReorder(exercise.id,exercise.position - 1 )}><ChevronUp /></button>
                <button disabled={idx === exercises.length - 1} onclick={() => onReorder(exercise.id, exercise.position + 1)}><ChevronDown /></button>
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
        font-size: var(--font-size-3);
        font-weight: var(--font-weight-7);
    }

    li {
        display: flex;
        align-items: center;
        justify-content: space-between;

        div { 
            display: flex;
            gap: var(--size-3);
        }
    }

    button {
        min-width: 44px;
        min-height: 44px;

        border: 1px solid hsl(var(--magnolia-hsl) / 50%);
        border-radius: var(--radius-3);

        display: flex;
        align-items: center;
        justify-content: center;

        :global(svg) {
            height: var(--size-4);
            width: var(--size-4);
        }

    }

    button:disabled {
        opacity: 0.5;
    }
</style>
