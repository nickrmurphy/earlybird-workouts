<script lang="ts">
  import { Drawer } from "../../ui";
  import type { Snippet } from "svelte";

  type Props = {
    open: boolean;
    name: string;
    instructions: string[];
    footer?: Snippet;
  };

  let { open = $bindable(), name, footer, instructions }: Props = $props();
</script>

<Drawer bind:open title={name} {footer}>
  <ol>
    {#each instructions as instruction, idx (idx)}
      <li>
        <span>{idx + 1}.</span>
        {instruction}
      </li>
    {/each}
  </ol>
</Drawer>

<style>
  ol {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    padding: var(--size-2);

    li {
      font-size: var(--font-size-2);
      line-height: var(--font-lineheight-4);
      span {
        font-weight: var(--font-weight-7);
      }
    }
  }
</style>
