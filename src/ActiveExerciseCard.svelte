<script lang="ts">
  import { CircleEmpty } from "./icons";
  import CheckmarkCircle from "./icons/CheckmarkCircle.svelte";

    type Props = {
        exerciseName: string;
        setCount: number;
        isComplete: boolean;
    }

    let { exerciseName, setCount, isComplete }: Props = $props();
</script>

<div class="card">
    <div>
        {#if isComplete}
            <CheckmarkCircle />
        {:else}
            <CircleEmpty />
        {/if}
    </div>
    <div class="container">
        <h3>{exerciseName}</h3>
        <p>{setCount} sets</p>
    </div>
</div>

<style>
    .card {
        display: flex;
        gap: var(--size-2);
        padding: var(--size-2);
        border: 1px solid var(--yellow);
        border-radius: var(--radius-3);
        background-color: hsl(var(--yellow-hsl) / 5%);
    }

    .card div:first-child {
        display: flex;
        align-items: center;

        :global(svg) {
            width: var(--size-5);
            height: var(--size-5);
        }
    }

    h3 {
        font-size: var(--font-size-3);
        font-weight: var(--font-weight-6);
    }

    .container {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
    }
</style>