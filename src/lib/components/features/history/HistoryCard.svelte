<script lang="ts">
  import { dateDifferenceInMinutes, dateFormatter } from "$lib/utils";
  import { IconCircleCheck, IconClock } from "@tabler/icons-svelte";
  import type { HTMLAttributes } from "svelte/elements";

  type Props = HTMLAttributes<HTMLElement> & {
    startTime: Date;
    endTime?: Date;
    workoutName?: string;
    exerciseCount: number;
  };

  let { startTime, endTime, exerciseCount, workoutName, ...props }: Props =
    $props();
</script>

<section
  {...props}
  class={[
    props.class,
    "border-border bg-surface text-foreground flex flex-col gap-3 rounded-sm border px-3 py-2 shadow",
  ]}
>
  <header class="flex items-baseline justify-between text-xl font-bold">
    <time>{dateFormatter.format(new Date(startTime))}</time>
    {#if workoutName}
      <span class="text-muted-foreground text-sm">{workoutName}</span>
    {/if}
  </header>
  <div>
    <span>
      <IconCircleCheck color="var(--color-accent)" size={16} />
      <span class="count">{exerciseCount}</span> exercise{exerciseCount === 1
        ? ""
        : "s"}
    </span>
    {#if endTime}
      <span>
        <IconClock size={16} />
        <time class="count">{dateDifferenceInMinutes(startTime, endTime)}</time>
        min.
      </span>
    {/if}
  </div>
</section>

<style>
  div {
    display: flex;
    justify-content: space-between;
    align-items: center;

    span {
      display: flex;
      align-items: center;
      gap: var(--size-2);
    }

    .count {
      font-weight: var(--font-weight-7);
    }

    time {
      font-weight: var(--font-weight-7);
    }
  }
</style>
