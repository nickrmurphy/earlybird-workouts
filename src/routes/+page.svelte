<script lang="ts">
  import Button from "../Button.svelte";
import Dialog from "../Dialog.svelte";
import Heading from "../Heading.svelte";
  import Input from "../Input.svelte";
  import WorkoutCard from "../WorkoutCard.svelte";

  const workouts = [
    {
      name: "Push",
      exercises: ["Bench Press", "Triceps Dip", "Tricep Kickback", "Pec Fly"],
    },
    {
      name: "Pull",
      exercises: ["Pull-up", "Bicep Curl", "Lat Pulldown", "Face Pull"],
    },
    {
      name: "Legs",
      exercises: ["Squat", "Deadlift", "Lunges", "Leg Press"],
    }
  ];
</script>

<main>
  <header>
    <Heading>
      Workouts
    </Heading>
      <Button rounded="full" popovertarget="create-workout">
        +
      </Button>
</header>
  <section class="workouts">
    {#each workouts as workout}
      <a href="/12">
        <WorkoutCard
          workoutName={workout.name}
          exercises={workout.exercises}
        />
      </a>
    {/each}
  </section>
</main>

<Dialog id="create-workout" popover="auto">
  <h2>Workout name</h2>
  <Input />
  {#snippet actions()}
    <Button variant="ghost" popovertargetaction="hide" popovertarget="create-workout">Cancel</Button>
    <Button>Save</Button>
  {/snippet}
</Dialog>

<style>
  header, main {
    padding: var(--size-1) var(--size-2);
  }

  main {
    display: flex;
    flex-direction: column;
    gap: var(--size-5);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  section.workouts {
    display: flex;
    gap: var(--size-4);
    overflow: scroll;
  }

  h2 {
    font-size: var(--size-4);
    font-weight: var(--font-weight-5);
  }
</style>
