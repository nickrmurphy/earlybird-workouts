<script lang="ts">
    type Props = {
        name: string;
        sets: number;
        reps: number;
        weight: number;
    };

    let { name, sets, reps, weight }: Props = $props();
</script>

<div class="container">
    <div class="weight">
        <span>{weight}</span>
        <span class="weight-unit">lbs</span>
    </div>
    <div class="details">
        <span class="name">{name}</span>
        <span>{reps} reps, {sets} sets</span>
    </div>
</div>

<style>
    .container {
        display: flex;
        justify-content: space-between;
        padding: var(--size-3) var(--size-2);
        gap: var(--size-3);
        align-items: center;
    }

    .weight {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        font-size: small;
        color: var(--raisin-black);
        background-color: var(--yellow);
        border-radius: var(--radius-round);
        height: var(--size-8);
        width: var(--size-8);
        font-size: var(--font-size-2);
        font-weight: var(--font-weight-6);
    }

    .weight-unit {
        font-size: var(--font-size-0);
    }

    .details {
        display: grid;
    }

    .name {
        font-weight: var(--font-weight-6);
        font-size: var(--font-size-2);
    }

</style>