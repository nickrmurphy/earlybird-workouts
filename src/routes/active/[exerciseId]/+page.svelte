<script lang="ts">
    let { data } = $props();
</script>

<a href="/active">Back</a>
Details

{#each data.exerciseSets as set}
    <div>
        <label>
            Reps
            <input type="number" defaultValue={set.reps} />
        </label>

        <label>
            Weight
            <input type="number" defaultValue={set.weight} />
        </label>
        <button>
            {set.isComplete ? 'Complete' : 'Incomplete'}
        </button>
    </div>
{/each}

<style>
    div {
        display: grid;
        grid-template-columns: repeat(5, minmax(0, 1fr));
        gap: var(--size-2);
        margin: var(--size-2) 0;

        button {
            border: 1px solid black;
        }
    }

    label {
        display: grid;
        gap: var(--size-2);
        margin: var(--size-2) 0;
        grid-column: span 2 / span 2;
    }

    input {
        flex: 1;
    }
</style>