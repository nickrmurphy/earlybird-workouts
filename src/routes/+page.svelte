<script lang="ts">
  import WorkoutCard from "../WorkoutCard.svelte";
</script>

<header>
    <h1>
      Workouts
    </h1>
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
  h1 {
    font-size: var(--font-size-6);
    font-weight: var(--font-weight-7);
  }

  header, main {
    padding: var(--size-1) var(--size-2);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  button {
    border-radius: 8px;
    padding: var(--size-1) var(--size-3);
    color: var(--raisin-black);
    background-color: var(--yellow);
  }
</style>
