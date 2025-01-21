<script lang="ts">
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLDivElement> & {
    name: string;
    sets: number;
    reps: number;
    weight: number;
  };

  let { name, sets, reps, weight, ...props }: Props = $props();
</script>

<div class="container" {...props}>
  <div class="weight">
    <span>{weight}</span>
    <span class="weight-unit">lbs</span>
  </div>
  <div class="details">
    <span class="name">{name}</span>
    <span>{sets} sets, {reps} reps</span>
  </div>
</div>

<style>
  .container {
    display: flex;
    align-items: center;
    gap: var(--size-3);
    padding: var(--size-3) var(--size-2);
    width: 100%;
  }

  .weight {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 2px solid var(--primary);
    border-radius: var(--radius-round);
    min-width: var(--size-8);
    min-height: var(--size-8);
    color: var(--foreground);
    font-weight: var(--font-weight-6);
    font-size: small;
    font-size: var(--font-size-2);
    text-align: center;
  }

  .weight-unit {
    font-size: var(--font-size-0);
  }

  .details {
    display: grid;
    gap: var(--size-2);
  }

  .name {
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-2);
  }
</style>
