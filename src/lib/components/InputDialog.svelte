<script lang="ts">
  import type { HTMLDialogAttributes } from "svelte/elements";
  import { Button, Input } from "./ui";
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
  <div transition:fly={{ y: -200 }} role="dialog">
    <h1>{title}</h1>
    <form {onsubmit}>
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
          --width="50%"
          type="button"
          variant="outline"
          onclick={() => (open = false)}
        >
          Cancel
        </Button>
        <Button --width="50%" type="submit">
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
    z-index: 100;
    border: none;
    border-radius: var(--radius-3);
    background-color: var(--popover);
    padding-top: env(safe-area-inset-top);
    padding-right: var(--size-4);
    padding-bottom: var(--size-4);
    padding-left: var(--size-4);
    color: var(--foreground);
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
    backdrop-filter: blur(0px);
    inset: 0;
    background-color: hsl(var(--black-hsl) / 60%);
  }

  h1 {
    font-weight: 600;
    font-size: var(--size-4);
  }
</style>
