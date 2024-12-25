<script lang="ts">
  import Heading from "../Heading.svelte";
  import WorkoutCard from "../WorkoutCard.svelte";
</script>

<header>
    <Heading>
      Workouts
    </Heading>
    <a href="/new">
      <button>
        +
      </button>
    </a>
</header>
<main>
  <a href="/12">
    <WorkoutCard
      workoutName="Push"
      exercises={["Bench Press", "Triceps Dip", "Tricep Kickback", "Pec Fly"]}
    />
  </a>
</main>

<style>
  header, main {
    padding: var(--size-1) var(--size-2);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  button {
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: var(--radius-round);
    height: var(--size-7);
    width: var(--size-7);
    padding: var(--size-1) var(--size-3);
    color: var(--raisin-black);
    background-color: var(--yellow);

  }
</style>
