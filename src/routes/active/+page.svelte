<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    Button,
    ActiveExerciseCard,
    Navbar,
    NavbarActionItem,
    Pressable,
    TimerButton,
    Page,
    PageHeader,
  } from "$lib/components";
  import { completeWorkout } from "$lib/mutations";
  import { activity } from "$lib/stores";
  import { goto } from "$app/navigation";
  import { IconChecks } from "@tabler/icons-svelte";

  let { data } = $props();

  async function confirmEndWorkout() {
    const confirmEnd = await confirm(
      "This action cannot be reverted. Are you sure?",
      { title: "End workout", kind: "warning", okLabel: "Finish" },
    );

    if (confirmEnd) {
      activity.restTimer.stop();
      completeWorkout(data.activeWorkout.id).then(() => {
        goto(
          `/${data.activeWorkout.workoutId}/history/${data.activeWorkout.id}`,
        );
      });
    }
  }
</script>

<Page>
  <PageHeader title={data.activeWorkout.workoutName}>
    {#snippet right()}
      <button onclick={confirmEndWorkout}>
        <IconChecks color="var(--primary)" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  {#each data.workoutExercises as exercise}
    <Pressable href={`/active/${exercise.id}`}>
      <ActiveExerciseCard
        exerciseName={exercise.name}
        setCount={exercise.sets}
        completeSets={exercise.completeSets}
        isComplete={exercise.isComplete > 0}
      />
    </Pressable>
  {/each}
</Page>
<Navbar>
  {#snippet actions()}
    <NavbarActionItem>
      Rest time:
      <select bind:value={activity.restTimer.runTimeSeconds}>
        {#each [10, 20, 30, 45, 60, 90, 120, 180] as time}
          <option value={time}>{time}s</option>
        {/each}
      </select>
    </NavbarActionItem>
  {/snippet}
  <TimerButton
    width="100%"
    onclick={() => activity.restTimer.toggle()}
    elapsedTime={activity.restTimer.elapsedTime}
    runTimeSeconds={activity.restTimer.runTimeSeconds}
    isRunning={activity.restTimer.isRunning}
    isExpired={activity.restTimer.isExpired}
  />
</Navbar>

<style>
  select {
    border: 1px solid var(--primary-color);
    border-radius: var(--radius-3);
    background: none;
    padding: var(--size-2) var(--size-3);
    color: var(--black);
  }
</style>
