<script lang="ts">
  import { CheckmarkCircle, CircleEmpty } from "$lib/icons";

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
              <span><CheckmarkCircle /></span>
            {:else}
              <span><CircleEmpty /></span>
            {/if}
          </td>
        </tr>
      {/each}
    </tbody>
  </table>
</section>

<style>
  h4 {
    background-color: hsl(var(--yellow-hsl) / 70%);
    padding: var(--size-3) var(--size-2);
    color: hsl(var(--black-hsl) / 80%);
    font-weight: var(--font-weight-7);
    font-size: var(--font-size-2);
  }

  section {
    display: flex;
    flex-direction: column;

    border: 1px solid var(--border-color);
    border-radius: var(--size-3);
    overflow: hidden;
  }

  thead {
    text-align: left;

    tr {
      background-color: hsl(var(--yellow-hsl) / 10%);

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
</style>
