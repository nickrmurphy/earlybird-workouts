<script lang="ts">
  type Props = {
    header?: string;
    message?: string;
  };
  let { message, header }: Props = $props();
</script>

<div>
  <p class="header">{header}</p>
  <p class="message">{message}</p>
</div>

<style>
  div {
    border-radius: var(--radius-3);
    background-color: var(--muted);
    padding: var(--size-7) var(--size-4);

    p {
      color: var(--muted-foreground);
      text-align: center;
    }

    .header {
      margin-bottom: var(--size-4);

      font-weight: var(--font-weight-7);
      font-size: var(--size-4);
    }
  }
</style>
