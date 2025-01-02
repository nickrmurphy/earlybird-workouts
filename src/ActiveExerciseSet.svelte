<script lang="ts">
  import Button from "./Button.svelte";
  import Checkmark from "./icons/Checkmark.svelte";

    type Props = {
        setId: number;
        reps: number;
        weight: number;
        isComplete: boolean;
        onToggleComplete?: (isComplete: boolean) => void;
        onRepsChange?: (reps: number) => void;
        onWeightChange?: (weight: number) => void;
    }

    let { reps, weight, isComplete, setId, onRepsChange, onToggleComplete, onWeightChange}: Props = $props();
</script>

<div>
    <section>
        <label for={`reps-${setId}`}>
            Reps
        </label>
        <input id={`reps-${setId}`} min={0} disabled={isComplete} type="number" defaultValue={reps} onchange={(e) => onRepsChange?.(Number(e.currentTarget.value))} />
    </section>

    <section>
        <label for={`weight-${setId}`}>
            Weight <span class="unit">(lbs)</span>
        </label>
        <input id={`weight-${setId}`} min={0} disabled={isComplete} type="number" defaultValue={weight} onchange={(e)=> onWeightChange?.(Number(e.currentTarget.value))} />
    </section>

    <section class="checkbox">
        <Button rounded="full" variant={isComplete ? "primary" : "outline"} onclick={() => onToggleComplete?.(!isComplete)}>
            {#if isComplete}
                <Checkmark />
            {/if}
        </Button>
    </section>    
</div>


<style>
    div {
        display: grid;
        grid-template-columns: repeat(5, minmax(0, 1fr));
        gap: var(--size-2);
        margin: var(--size-2) 0;
    }

    label {
        font-weight: var(--font-weight-5);
        display: flex;
        gap: var(--size-2);
        .unit {
            color: hsl(var(--magnolia-hsl) / 70%);
        }
    }

    section {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        margin: var(--size-2) 0;
        grid-column: span 2 / span 2;
    }

    section.checkbox {
        grid-column: span 1 / span 1;
        padding-top: var(--size-5);
        align-items: center;
    }

    input {
        display: flex;
        background-color: transparent;
        color: var(--magnolia);
        font-size: var(--font-size-3);
        font-weight: var(--font-weight-7);
        border: 1px solid hsl(var(--magnolia-hsl) / 50%);
    }
</style>