<script lang="ts">
  import WorkoutCard from "../WorkoutCard.svelte";
</script>

<header>
    <h1>
      Workouts
    </h1>
    <a href="/new">
      Add
  </a>
</header>
<main>
  <WorkoutCard workoutName="Push" exercises={["Bench Press", "Tricpes Dip", "Tricep Kickback", "Pec Fly"]} />
</main>

<style>
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  a {
    border-radius: 8px;
    border: 1px solid transparent;
    padding: var(--size-1) var(--size-3);
    font-size: 1em;
    font-weight: 500;
    font-family: inherit;
    color: #0f0f0f;
    background-color: #ffffff;
    transition: border-color 0.25s;
    box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
  }
</style>
