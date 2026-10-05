<script lang="ts">
  import { CheckCircleIcon, CircleIcon } from "phosphor-svelte";

  type Props = {
    exerciseName: string;
    sets: {
      weight: number;
      count: number;
      isSuccess: boolean;
    }[];
  };

  let { exerciseName, sets }: Props = $props();
</script>

<section>
  <h4
    class="text-muted-foreground px-1 pb-3 text-lg font-semibold tracking-wider uppercase"
  >
    {exerciseName}
  </h4>
  <div class="border-border w-full overflow-hidden rounded-sm border">
    <table class="bg-surface w-full">
      <thead class="border-border border-b text-left">
        <tr class="text-muted-foreground text-sm font-semibold">
          <th><span class="pl-4">Weight</span></th>
          <th>Reps</th>
          <th>Complete</th>
        </tr>
      </thead>
      <tbody class="divide-divide divide-y">
        {#each sets as set, index (index)}
          <tr>
            <td><span class="pl-4">{set.weight}</span></td>
            <td>{set.count}</td>
            <td>
              {#if set.isSuccess}
                <span><CheckCircleIcon color="var(--color-accent)" /></span>
              {:else}
                <span><CircleIcon color="var(--color-foreground)" /></span>
              {/if}
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</section>

<style>
  th,
  td {
    padding: var(--size-3) 0;
    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }
</style>
