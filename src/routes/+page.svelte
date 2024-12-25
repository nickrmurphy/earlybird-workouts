<script lang="ts">
  import WorkoutCard from "../WorkoutCard.svelte";
</script>

<header>
    <h1>
      Workouts
    </h1>
    <a href="/new">
      <button>
        Add
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
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  button {
    border-radius: 8px;
    border: 1px solid black;
    padding: var(--size-1) var(--size-3);
    font-size: 1em;
    font-weight: 500;
    font-family: inherit;
    color: #0f0f0f;
    background-color: #ffffff;
    transition: border-color 0.25s;
  }
</style>
