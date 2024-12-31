<script lang="ts">
    type Props = {
            workoutName: string;
            exercises: string[];
    };
    let { workoutName, exercises }: Props = $props();
    const DISPLAY_COUNT = 3;
    const overflowCount = $derived(exercises.length - DISPLAY_COUNT);
</script>

<div class="container">
    <h3>{workoutName}</h3>
    <footer>
        <div class="exercise-list">
            <div>
                <span class="exercise-count">
                    {exercises.length}
                </span>
                <span class="exercise-count-label">
                    Exercises
                </span>
            </div>
            {#each exercises.slice(0, DISPLAY_COUNT) as exercise}
                <div class="exercise-name">
                    {exercise}
                </div>
            {/each}
        </div>
        <div class="overflow-container">
            {#if overflowCount > 0}
                <div class="overflow-count">
                    <span>+ {overflowCount} more</span>
                </div>
            {/if}
        </div>
    </footer>
</div>

<style>
    h3 {
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-3);
    }
    h3, footer {
        padding: var(--size-1) var(--size-2);
    }

    footer {
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        gap: var(--size-4);
    }

    .container {
        border-radius: var(--radius-3);
        border: 1px solid hsl(var(--yellow-hsl) / 20%);
        background-color: hsl(var(--yellow-hsl) / 10%);
        padding: var(--size-1);
        display: flex;
        flex-direction: column;
        gap: var(--size-3);
    }

    .exercise-list {
        display: flex;
        flex-direction: column;
        font-size: var(--font-size-1);
        line-height: var(--font-size-3);
        gap: var(--size-2);
    }

    .exercise-name {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .exercise-count {
        font-weight: 600;
    }

    .exercise-count-label {
        font-weight: var(--font-weight-2);
        text-transform: uppercase;
        font-size: var(--font-size-0);
    }

    .overflow-container {
        margin-top: auto;
    }

    .overflow-count {
        border-radius: var(--radius-round);
        padding: var(--size-1) var(--size-2);
        font-size: small;
        border: 1px solid;
        width: fit-content;
    }
</style>