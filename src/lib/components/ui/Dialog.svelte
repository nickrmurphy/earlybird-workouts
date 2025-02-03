<script lang="ts">
  import type { Snippet } from "svelte";
  import type { HTMLDialogAttributes } from "svelte/elements";
  type Props = HTMLDialogAttributes & {
    actions?: Snippet;
    header?: Snippet;
  };

  let { children, actions, header, ...props }: Props = $props();
</script>

<dialog {...props}>
  {#if header}
    <header>
      {@render header()}
    </header>
  {/if}

  {#if children}
    <div>
      {@render children?.()}
    </div>
  {/if}

  {#if actions}
    <footer>
      {@render actions()}
    </footer>
  {/if}
</dialog>

<style>
  dialog {
    border: none;
    border-radius: var(--radius-3);
    background-color: var(--color-background);
    padding: var(--padding, 0);
    width: 100%;
    max-width: var(--max-width, var(--size-xs));
    max-height: calc(
      100vh - env(safe-area-inset-top) - env(safe-area-inset-bottom) -
        var(--size-4)
    );
    color: var(--magnolia);
    /* display: flex;
        flex-direction: column; */
  }

  dialog::backdrop {
    opacity: 0.7;
    transition: all 0.3s;
    background-color: black;
  }

  footer {
    display: flex;
    display: flex;
    position: sticky;
    position: -webkit-sticky; /* for Safari */
    bottom: 0;
    flex-direction: column;
    justify-content: flex-end;
    gap: var(--size-2);
    gap: var(--size-3);
    background-color: var(--color-background);
    padding: var(--size-2);
  }

  div {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
    padding: var(--size-4);
  }

  header {
    display: flex;
    position: sticky;
    position: -webkit-sticky; /* for Safari */
    top: 0;
    flex-direction: column;
    align-self: flex-start;
    gap: var(--size-3);
    background-color: var(--color-background);
    padding: var(--size-4);
    font-weight: var(--font-weight-6);
    font-size: var(--font-size-3);
  }
</style>
