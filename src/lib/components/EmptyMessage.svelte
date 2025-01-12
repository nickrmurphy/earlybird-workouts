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
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    padding: var(--size-7) var(--size-4);

    p {
      color: hsl(var(--magnolia-hsl) / 80%);
      text-align: center;
    }

    .header {
      margin-bottom: var(--size-4);

      font-weight: var(--font-weight-7);
      font-size: var(--size-4);
    }
  }
</style>
