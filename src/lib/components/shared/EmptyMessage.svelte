<script lang="ts">
  type Props = {
    header?: string;
    message?: string;
  };
  let { message, header }: Props = $props();
</script>

<div
  class="bg-surface text-muted-foreground grid gap-4 rounded-sm px-8 py-5 text-center"
>
  <p class="text-xl font-bold">{header}</p>
  <p>{message}</p>
</div>
