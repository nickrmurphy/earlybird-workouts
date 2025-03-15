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
  import { goto } from "$app/navigation";
  import { ExerciseSearch, globalState } from "$lib/state";
  import { getDefaultWeightUnit } from "$lib/utils";
  import {
    createActivitySet,
    updateActivity,
    type ExerciseDetail,
  } from "$lib/resources";

  let { data } = $props();

  let settingsDrawerOpen = $state(false);
  let exerciseDrawerOpen = $state(false);

  const exerciseSearch = new ExerciseSearch(data.allExercises);

  $effect(() => {
    if (!globalState.activity.timer.isRunning && data.activity.startTime) {
      globalState.activity.timer.start(data.activity.startTime);
    }
  });

  async function confirmEndWorkout() {
    const confirmEnd = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "End workout", kind: "warning", okLabel: "Finish" },
    );

    if (confirmEnd) {
      updateActivity(data.activity.id, {
        endTime: new Date().toUTCString(),
      }).then(() => {
        globalState.activity.clearCurrentId();
        goto(`/${data.activity.workoutId}/history/${data.activity.id}`);
      });
    }
  }

  async function addExercise(exercise: ExerciseDetail) {
    // Check if the exercise is already in the workout
    if (!data.exerciseIds.includes(exercise.id)) {
      return;
    }

    createActivitySet({
      activityId: data.activity.id,
      exerciseId: exercise.id,
      count: 10,
      weight: 40,
      isComplete: 0,
      weightUnit: getDefaultWeightUnit(),
      countUnit: "rep",
      workoutId: "",
      workoutName: "",
      exerciseName: "",
      order: 0,
    });
  }
</script>

<Page>
  <PageHeader title={data.activity.workoutName}>
    {#snippet right()}
      <div class="flex items-center gap-8">
        <TimerDisplay elapsedSeconds={globalState.activity.timer.seconds}>
          {#snippet icon()}
            <IconStopwatch class="size-4" />
          {/snippet}
        </TimerDisplay>
        <button onclick={confirmEndWorkout}>
          <IconChecks color="var(--color-accent)" size={24} />
        </button>
      </div>
    {/snippet}
  </PageHeader>
  {#each Object.values(data.exerciseSets) as exercise (exercise.id)}
    <Pressable href={`/activity/${data.activity.id}/${exercise.id}`}>
      <ActiveExerciseCard
        exerciseName={exercise.name}
        setCount={exercise.sets.length}
        completeSets={exercise.sets.filter((set) => set.isComplete).length}
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
            {exercise.exerciseName}
          </button>
        </li>
      {/each}
    </ul>
  </section>
</Drawer>
