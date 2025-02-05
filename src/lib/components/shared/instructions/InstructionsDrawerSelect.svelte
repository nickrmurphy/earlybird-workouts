<script lang="ts">
  import { Button } from "$lib/components/ui";
  import type { ComponentProps } from "svelte";
  import InstructionsDrawer from "./InstructionsDrawer.svelte";

  type Props = ComponentProps<typeof InstructionsDrawer> & {
    isSelected: boolean;
    exerciseId: string;
    onAddExercise: (id: string) => void;
    onRemoveExercise: (id: string) => void;
  };

  let {
    open = $bindable(),
    isSelected,
    exerciseId,
    onAddExercise,
    onRemoveExercise,
    ...props
  }: Props = $props();
</script>

<InstructionsDrawer bind:open {...props}>
  {#snippet footer()}
    <Button
      variant="outline"
      onclick={async () => {
        isSelected ? onRemoveExercise(exerciseId) : onAddExercise(exerciseId);
        open = false;
      }}
    >
      {#if isSelected}
        Remove
      {:else}
        Select
      {/if}
    </Button>
  {/snippet}
</InstructionsDrawer>
