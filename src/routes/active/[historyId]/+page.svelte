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
    Input,
    TimerDisplay,
    Select,
  } from "$lib/components";
  import {
    IconAdjustmentsHorizontal,
    IconChecks,
    IconPlus,
    IconStopwatch,
  } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";
  import { db, type Exercise } from "$lib/db";
  import { goto } from "$app/navigation";
  import { ExerciseSearch, globalState } from "$lib/state";
  import { getDefaultWeightUnit } from "$lib/utils";

  let { data } = $props();

  let settingsDrawerOpen = $state(false);
  let exerciseDrawerOpen = $state(false);

  let activeWorkout = liveQuery(() => db.history.get(data.historyId));

  let exercises = liveQuery(() =>
    db.historyExercises.where("historyId").equals(data.historyId).toArray(),
  );

  let exerciseSets = liveQuery(() =>
    db.historySets.where("historyId").equals(data.historyId).toArray(),
  );

  const exerciseSearch = new ExerciseSearch(data.allExercises);

  $effect(() => {
    if (!globalState.activity.timer.isRunning && $activeWorkout?.startTime) {
      globalState.activity.timer.start($activeWorkout.startTime);
    }
  });

  async function confirmEndWorkout() {
    const confirmEnd = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "End workout", kind: "warning", okLabel: "Finish" },
    );

    if (confirmEnd) {
      db.history.update(data.historyId, { endTime: new Date() }).then(() => {
        globalState.activity.clearCurrentId();
        goto(`/${$activeWorkout?.workoutId}/history/${data.historyId}`);
      });
    }
  }

  async function addExercise(exercise: Exercise) {
    // Check if the exercise is already in the workout
    if ($exercises.some((e) => e.exerciseId === exercise.id)) {
      return;
    }

    await db.transaction(
      "rw",
      [db.historyExercises, db.historySets],
      async () => {
        let historyExerciseId = await db.historyExercises.add({
          historyId: data.historyId,
          exerciseName: exercise.name,
          exerciseId: exercise.id,
        });

        await db.historySets.add({
          historyId: data.historyId,
          historyExerciseId,
          exerciseId: exercise.id,
          count: 10,
          weight: 40,
          isSuccess: false,
          weightUnit: getDefaultWeightUnit(),
          countUnit: "reps",
        });
      },
    );
  }
</script>

<Page>
  <PageHeader title={$activeWorkout?.workoutName}>
    {#snippet right()}
      <div class="flex items-center gap-8">
        {#if $activeWorkout}
          <TimerDisplay elapsedSeconds={globalState.activity.timer.seconds}>
            {#snippet icon()}
              <IconStopwatch class="size-4" />
            {/snippet}
          </TimerDisplay>
        {/if}
        <button onclick={confirmEndWorkout}>
          <IconChecks color="var(--color-accent)" size={24} />
        </button>
      </div>
    {/snippet}
  </PageHeader>
  {#each $exercises || [] as exercise (exercise.exerciseId)}
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
  <NavbarButton
    variant="secondary"
    onclick={() => (settingsDrawerOpen = !settingsDrawerOpen)}
  >
    <IconAdjustmentsHorizontal />
  </NavbarButton>
  <TimerButton
    onclick={() => globalState.activity.restTimer.toggle()}
    elapsedTime={globalState.activity.restTimer.elapsedTime}
    runTimeSeconds={globalState.activity.restTimer.runTimeSeconds}
    isRunning={globalState.activity.restTimer.isRunning}
    isExpired={globalState.activity.restTimer.isExpired}
  />
  <NavbarButton variant="secondary" onclick={() => (exerciseDrawerOpen = true)}>
    <IconPlus />
  </NavbarButton>
</Navbar>
<Drawer
  bind:open={settingsDrawerOpen}
  class="h-[30%]!"
  title="Activity settings"
>
  <label class="grid gap-2 font-medium">
    <span class="text-muted-foreground text-sm tracking-wider uppercase"
      >Rest time</span
    >
    <Select
      class="rounded-sm border px-3 py-2"
      bind:value={globalState.activity.restTimer.runTimeSeconds}
    >
      {#each [10, 20, 30, 45, 60, 90, 120, 180] as time (time)}
        <option value={time}>{time}s</option>
      {/each}
    </Select>
  </label>
</Drawer>
<Drawer bind:open={exerciseDrawerOpen} title="Add an exercise">
  <section>
    <div class="bg-surface sticky top-14 w-full">
      <Input
        class="w-full"
        bind:value={exerciseSearch.term}
        placeholder="Search exercises..."
      />
    </div>
    <ul class="divide-divide divide-y">
      {#each exerciseSearch.filteredOptions as exercise (exercise.id)}
        <li>
          <button
            class="w-full p-3 text-start text-lg font-semibold"
            onclick={() => {
              exerciseDrawerOpen = false;
              addExercise(exercise);
            }}
          >
            {exercise.name}
          </button>
        </li>
      {/each}
    </ul>
  </section>
</Drawer>
