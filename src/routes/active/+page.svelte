<script lang="ts">
  import { confirm } from "@tauri-apps/plugin-dialog";
  import {
    Button,
    ActiveExerciseCard,
    Navbar,
    PageHeader,
    NavbarActionItem,
    Pressable,
  } from "$lib/components";
  import { completeWorkout } from "$lib/mutations";
  import { activity } from "$lib/stores";
  import { Play, StopCircle } from "$lib/icons";
  import { goto } from "$app/navigation";

  let { data } = $props();

  let elapsedTime = $derived.by(() => {
    let time = activity.restTimer.elapsedTime;
    if (time < 10) {
      return `0${time}`;
    } else {
      return time.toString();
    }
  });

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

  function toggleTimer() {
    if (activity.restTimer.isRunning) {
      activity.restTimer.stop();
    } else {
      activity.restTimer.start();
    }
  }
</script>

<PageHeader title={data.activeWorkout.workoutName} />
<main>
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
</main>
<Navbar>
  {#snippet actions()}
    <NavbarActionItem>
      Rest time:
      <select bind:value={activity.restTimer.runTimeSeconds}>
        {#each [10, 20, 30, 45, 60, 90, 120, 180] as time}
          <option value={time}>{time}s</option>
        {/each}
      </select>
      <!-- <input type="range" step={5} min={5} max={180} bind:value={restTimeSeconds} /> -->
    </NavbarActionItem>
  {/snippet}
  <Button --width="50%" rounded="full" variant="outline" onclick={toggleTimer}>
    {#if activity.restTimer.isRunning}
      <StopCircle />
    {:else}
      <Play />
    {/if}
    <time data-expired={activity.restTimer.isExpired}
      >{elapsedTime}/{activity.restTimer.runTimeSeconds} s.</time
    >
  </Button>
  <Button onclick={confirmEndWorkout} --width="50%" rounded="full">
    End workout
  </Button>
</Navbar>

<style>
  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-3);
    margin-top: var(--size-3);
    padding: var(--size-2);

    padding-bottom: var(--navbar-height);
  }

  time {
    font-size: var(--font-size-0);
  }

  time[data-expired="true"] {
    color: var(--rust);
  }

  select {
    border: 1px solid var(--yellow);
    border-radius: var(--radius-3);
    background: none;
    padding: var(--size-2) var(--size-3);
    color: var(--black);
  }
</style>
