<script lang="ts">
  import type { HTMLDialogAttributes } from "svelte/elements";
  import { Button, Input } from "../ui";
  import { fade, fly } from "svelte/transition";

  let {
    defaultValue,
    title,
    onSubmit,
    submitText = "Submit",
    placeholder,
    open = $bindable(false),
  }: HTMLDialogAttributes & {
    title: string;
    onSubmit: (value: string) => void;
    submitText: string;
    open: boolean;
    defaultValue?: string;
    placeholder?: string;
  } = $props();

  let value = $state(defaultValue ?? "");

  $effect(() => {
    if (open) {
      value = defaultValue ?? "";
    } else {
      value = defaultValue ?? "";
    }
  });

  function onsubmit(e: Event) {
    e.preventDefault();
    onSubmit(value);
    open = false;
  }
</script>

{#if open}
  <div
    transition:fade={{ duration: 200 }}
    class="overlay"
    role="none"
    onclick={(e) => {
      e.stopPropagation();
      open = false;
    }}
  ></div>
  <div
    transition:fly={{ y: -200 }}
    role="dialog"
    class="bg-surface rounded-sm border-2 border-white"
  >
    <form {onsubmit}>
      <h1 class="text-lg font-semibold">{title}</h1>
      <Input
        bind:value
        {placeholder}
        minlength={1}
        min={1}
        type="text"
        autofocus
        enterkeyhint="done"
      />
      <footer>
        <Button
          class="w-1/2"
          type="button"
          variant="outline"
          onclick={() => (open = false)}
        >
          Cancel
        </Button>
        <Button class="w-1/2" type="submit">
          {submitText}
        </Button>
      </footer>
    </form>
  </div>
{/if}

<style>
  div[role="dialog"] {
    display: flex;
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    flex-direction: column;
    gap: var(--size-5);
    z-index: var(--layer-5);
    border: none;
    padding-top: env(safe-area-inset-top);
    padding-right: var(--size-4);
    padding-bottom: var(--size-4);
    padding-left: var(--size-4);
  }

  form {
    display: flex;
    flex-direction: column;
    gap: var(--size-4);
  }

  footer {
    display: flex;
    gap: var(--size-4);
  }

  .overlay {
    position: fixed;
    opacity: 0.7;
    z-index: var(--layer-4);
    backdrop-filter: blur(0px);
    inset: 0;
    background-color: black;
  }
</style>
