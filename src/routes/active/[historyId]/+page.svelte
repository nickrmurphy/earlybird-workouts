<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    ActiveExerciseCard,
    Navbar,
    Pressable,
    TimerButton,
    Page,
    PageHeader,
    NavbarButton,
    Drawer,
  } from "$lib/components";
  import { activity } from "$lib/stores";
  import { IconAdjustmentsHorizontal, IconChecks } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";
  import { db } from "$lib/db";
  import { goto } from "$app/navigation";

  let { data } = $props();

  let drawerOpen = $state(false);

  let activeWorkout = liveQuery(() => db.history.get(data.historyId));

  let exercises = liveQuery(() =>
    db.historyExercises.where("historyId").equals(data.historyId).toArray(),
  );

  let exerciseSets = liveQuery(() =>
    db.historySets.where("historyId").equals(data.historyId).toArray(),
  );

  async function confirmEndWorkout() {
    const confirmEnd = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "End workout", kind: "warning", okLabel: "Finish" },
    );

    if (confirmEnd) {
      activity.restTimer.stop();
      localStorage.removeItem("activeHistoryId");
      db.history.update(data.historyId, { endTime: new Date() }).then(() => {
        goto("/");
      });
    }
  }
</script>

<Page>
  <PageHeader title={$activeWorkout?.workoutName}>
    {#snippet right()}
      <button onclick={confirmEndWorkout}>
        <IconChecks color="var(--color-accent)" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  {#each $exercises || [] as exercise}
    {@const sets =
      $exerciseSets?.filter((s) => s.exerciseId === exercise.exerciseId) || []}
    <Pressable href={`/active/${data.historyId}/${exercise.exerciseId}`}>
      <ActiveExerciseCard
        exerciseName={exercise.exerciseName}
        setCount={sets.length}
        completeSets={sets.filter((set) => set.isSuccess === true).length}
        isComplete={sets.every((s) => s.isSuccess)}
      />
    </Pressable>
  {/each}
</Page>
<Navbar>
  <NavbarButton variant="secondary" onclick={() => (drawerOpen = !drawerOpen)}>
    <IconAdjustmentsHorizontal />
  </NavbarButton>
  <TimerButton
    onclick={() => activity.restTimer.toggle()}
    elapsedTime={activity.restTimer.elapsedTime}
    runTimeSeconds={activity.restTimer.runTimeSeconds}
    isRunning={activity.restTimer.isRunning}
    isExpired={activity.restTimer.isExpired}
  />
</Navbar>
<Drawer bind:open={drawerOpen} class="h-[30%]!" title="Activity settings">
  <label class="grid gap-2 font-medium">
    <span class="text-muted-foreground text-sm tracking-wider uppercase"
      >Rest time</span
    >
    <select
      class="rounded-sm border px-3 py-2"
      bind:value={activity.restTimer.runTimeSeconds}
    >
      {#each [10, 20, 30, 45, 60, 90, 120, 180] as time}
        <option value={time}>{time}s</option>
      {/each}
    </select>
  </label>
</Drawer>
