<script lang="ts">
  import { CircleEmpty } from "./icons";
  import CheckmarkCircle from "./icons/CheckmarkCircle.svelte";

    type Props = {
        options: { value: number, label: string }[];
        selected?: number[];
    };

    let { options, selected = $bindable([]) }: Props = $props();
</script>

<ul>
    {#each options as option}
        <li>
            {#if selected.includes(option.value)}
                <button onclick={() => selected = selected.filter((value) => value !== option.value)}>
                    <CheckmarkCircle />
                    {option.label}
                </button>
            {:else}
               <button onclick={() => selected.push(option.value)}>
                    <CircleEmpty />
                    {option.label}
                </button>
            {/if}
        </li>
    {/each}
</ul>

<style>
    li:not(:first-child) {
        border-top: 1px solid hsl(var(--magnolia-hsl) / 30%);
    }

    li {
        list-style: none outside;
        display: flex;
        button {
            display: flex;
            width: 100%;
            align-items: center;
            padding: var(--size-3) var(--size-2);
            gap: var(--size-2);

            :global(svg) {
                height: var(--size-4);
                width: var(--size-4);
            }
        }
    }
</style>