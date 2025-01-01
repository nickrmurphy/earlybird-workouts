<script lang="ts">
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
            Weight
        </label>
        <input id={`weight-${setId}`} min={0} disabled={isComplete} type="number" defaultValue={weight} onchange={(e)=> onWeightChange?.(Number(e.currentTarget.value))} />
    </section>

    <section class="checkbox">
        <input type="checkbox" defaultChecked={isComplete} onchange={(e) => onToggleComplete?.(e.currentTarget.checked)}  />
    </section>    
</div>


<style>
    div {
        display: grid;
        grid-template-columns: repeat(5, minmax(0, 1fr));
        gap: var(--size-2);
        margin: var(--size-2) 0;

        input[type="checkbox"] {
            margin-top: auto;
        }
    }

    label {
        font-weight: var(--font-weight-5);
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
    }

    input {
        display: flex;
        background-color: transparent;
        color: var(--magnolia);
        font-size: var(--font-size-3);
        font-weight: var(--font-weight-7);
    }

    input[type="checkbox"] {
        border-radius: var(--radius-round);
    }
</style>