<script lang="ts">
  import { IconCircle, IconCircleCheck } from "@tabler/icons-svelte";

  type Props = {
    exerciseName: string;
    sets: {
      weight: number;
      reps: number;
      isComplete: number;
    }[];
  };

  let { exerciseName, sets }: Props = $props();
</script>

<section>
  <h4>{exerciseName}</h4>
  <div>
    <table>
      <thead>
        <tr>
          <th>Weight</th>
          <th>Reps</th>
          <th>Complete</th>
        </tr>
      </thead>
      <tbody>
        {#each sets as set}
          <tr>
            <td>{set.weight}</td>
            <td>{set.reps}</td>
            <td>
              {#if set.isComplete}
                <span><IconCircleCheck color="var(--foreground)" /></span>
              {:else}
                <span><IconCircle color="var(--foreground)" /></span>
              {/if}
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</section>

<style>
  h4 {
    padding: var(--size-3) var(--size-2);
    color: var(--foreground);
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-2);
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  thead {
    text-align: left;

    tr {
      background-color: var(--popover);

      :first-child {
        padding-left: var(--size-2);
      }
    }
  }

  th,
  td {
    padding: var(--size-3) 0;
    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }

  th {
    color: var(--muted-foreground);
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-1);
  }

  tbody {
    tr {
      td {
        border-top: 1px solid var(--border-color);
      }
      :first-child {
        padding-left: var(--size-2);
      }
    }
  }

  div {
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    width: 100%;
    overflow: hidden;

    table {
      width: 100%;
    }
  }
</style>
