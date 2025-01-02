<script lang="ts">
    type Props = {
            workoutName: string;
            exercises: string[];
    };
    let { workoutName, exercises }: Props = $props();
    const DISPLAY_COUNT = 3;
    const overflowCount = $derived(exercises.length - DISPLAY_COUNT);
</script>

<section>
    <h3>{workoutName}</h3>
    <div>
        <span class="exercise-count">
            {exercises.length}
        </span>
        <span class="exercise-count-label">
            Exercises
        </span>
    </div>
    <ul>
        {#each exercises.slice(0, DISPLAY_COUNT) as exercise}
            <li>
                {exercise}
            </li>
        {/each}
        {#if overflowCount > 0}
            <li class="overflow-count">
                <span>+ {overflowCount} more</span>
            </li>
        {/if}
    </ul>
</section>

<style>
     section {
        border-radius: var(--radius-3);
        border: 1px solid hsl(var(--yellow-hsl) / 20%);
        background-color: hsl(var(--yellow-hsl) / 10%);
        padding: var(--size-1);
        display: flex;
        flex-direction: column;
        gap: var(--size-3);
        padding: var(--size-3);
    }

    h3 {
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-3);
    }

    ul {
        display: flex;
        flex-direction: column;
        font-size: var(--font-size-1);
        line-height: var(--font-size-3);
        gap: var(--size-2);
    }

    .exercise-count {
        font-weight: var(--font-weight-6);
    }

    .exercise-count-label {
        font-weight: var(--font-weight-2);
        text-transform: uppercase;
        font-size: var(--font-size-0);
    }

    .overflow-count {
        border-radius: var(--radius-round);
        padding: var(--size-1) var(--size-2);
        font-size: small;
        border: 1px solid;
        width: fit-content;
    }
</style>