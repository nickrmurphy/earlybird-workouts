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
        <span>lbs</span>
    </div>
    <div class="details">
        <span>{name}</span>
        <span>{reps} reps, {sets} sets</span>
    </div>
</div>

<style>
    .container {
        display: flex;
        justify-content: space-between;
        padding: 1rem;
        gap: var(--size-3);
    }

    .weight {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        font-size: small;
        border: 1px solid #000;
        border-radius: 9999px;
        height: var(--size-8);
        width: var(--size-8);
    }

    .details {
        display: grid;
    }

</style>