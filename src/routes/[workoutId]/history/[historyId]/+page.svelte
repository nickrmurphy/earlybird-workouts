<script lang="ts">
  import { page } from "$app/state";
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    Page,
    PageHeader,
    Navbar,
    ExerciseSetsTable,
    Dropdown,
    DropdownItem,
  } from "$lib/components";
  import { deleteHistory } from "$lib/db";
  import {
    calculateTonnage,
    dateDifferenceInMinutes,
    dateFormatter,
  } from "$lib/utils";
  import {
    IconClock,
    IconDotsCircleHorizontal,
    IconTrash,
    IconWeight,
  } from "@tabler/icons-svelte";
  import { goto } from "$app/navigation";

  let { data } = $props();

  let exercises = $derived.by(() => {
    const results: Map<
      string,
      {
        id: string;
        exerciseId: string;
        exerciseName: string;
        activityId: string;
      }
    > = new Map();
    for (const set of data.activitySets || []) {
      if (!results.has(set.exerciseId)) {
        results.set(set.exerciseId, {
          id: set.id,
          exerciseId: set.exerciseId,
          exerciseName: set.exerciseName,
          activityId: set.activityId,
        });
      }
    }

    return Array.from(results.values());
  });

  let runTime = $derived(
    data.activity && data.activity.endTime
      ? dateDifferenceInMinutes(data.activity.startTime, data.activity.endTime)
      : undefined,
  );

  let tonnage = $derived(
    data.activitySets ? calculateTonnage(data.activitySets) : undefined,
  );

  let dropdownToggle: HTMLElement | null = $state(null);

  async function confirmDelete() {
    const confirmDelete = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "Delete history", kind: "warning", okLabel: "Delete" },
    );

    if (confirmDelete) {
      await deleteHistory(page.params.historyId).then(() => {
        goto(`/${page.params.workoutId}/history`);
      });
    }
  }
</script>

<Page>
  <PageHeader title={data.activity.workoutName}>
    {#snippet right()}
      <button bind:this={dropdownToggle}>
        <IconDotsCircleHorizontal class="text-accent" />
      </button>
      <Dropdown anchor={dropdownToggle}>
        <DropdownItem onclick={confirmDelete}>
          Delete <IconTrash color="var(--color-red-500)" />
        </DropdownItem>
      </Dropdown>
    {/snippet}
  </PageHeader>
  <h2 class="font-display text-muted-foreground p-1 text-lg font-semibold">
    {dateFormatter.format(data.activity.startTime)}
  </h2>
  <div
    class="font-display flex items-center justify-between gap-2 rounded-sm p-1 text-lg font-semibold"
  >
    <div class="flex items-center gap-2">
      <IconClock class="size-5" />
      <span>{runTime}</span>
      min.
    </div>
    <div class="flex items-center gap-2">
      <IconWeight class="size-5" />
      <span>{tonnage}</span>
      lbs
    </div>
  </div>
  {#each exercises as exercise (exercise.exerciseId)}
    <ExerciseSetsTable
      exerciseName={exercise.exerciseName}
      sets={data.activitySets?.filter(
        (s) => s.exerciseId === exercise.exerciseId,
      )}
    />
  {/each}
  <Navbar
    backHref={page.url.searchParams.has("from")
      ? page.url.searchParams.get("from") || undefined
      : `/${page.params.workoutId}/history`}
  />
</Page>
