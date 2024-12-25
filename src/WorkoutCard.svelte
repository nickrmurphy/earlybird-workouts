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
        <div>
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
        border-radius: 8px;
        border: 1px solid black;
        max-width: var(--max-width, 300px);
    }

    .exercise-name {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 175px;
    }

    .exercise-count {
        font-weight: 600;
    }

    .exercise-count-label {
        font-weight: 500;
        text-transform: uppercase;
        font-size: x-small;
    }

    .overflow-container {
        margin-top: auto;
    }

    .overflow-count {
        border-radius: 9999px;
        padding: var(--size-1) var(--size-2);
        font-size: small;
        border: 1px solid black;
        width: fit-content;
    }
</style>