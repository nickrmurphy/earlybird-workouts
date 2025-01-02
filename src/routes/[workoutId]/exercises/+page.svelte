<script lang="ts">
  import ExerciseSelectList from "../../../ExerciseSelectList.svelte";
  import Heading from "../../../Heading.svelte";
  import Input from "../../../Input.svelte";
  import PageNavHeader from "../../../PageNavHeader.svelte";
  import { addExercise, removeExercise } from "$lib/workoutActions";

  let { data } = $props();

  let filterQuery = $state("");
  let exerciseOptions = $derived.by(() => {
      const filteredExercises = filterQuery === ""  ? data.allExercises : data.allExercises?.filter((exercise) =>
          exercise.name.toLowerCase().includes(filterQuery.toLowerCase())
      );  
      return filteredExercises?.map((exercise) => ({
          value: exercise.id,
          label: exercise.name,
      })) || [];
  });
    
  let selectedOptions = $derived(data.exercises.map((exercise) => exercise.id));
</script>

<div class="overflow"></div>
<section>
    <PageNavHeader backHref={`/${data.workout.id}`} backLabel={data.workout.name} />
    <header>
        <div>
            <Heading level={2}>Select exercises</Heading>
            <span class="selected-count">{selectedOptions.length}</span>
        </div>
        <Input bind:value={filterQuery}  />
    </header>
</section>
<main>
    <ExerciseSelectList
        selected={selectedOptions}    
        options={exerciseOptions}
        onAdd={async (value) => {
            await addExercise(data.workout.id, value);
        }}
        onRemove={async (value) => {
            await removeExercise(data.workout.id, value);
        }}
    />
</main>

<style>

    header, main {
        padding: var(--size-2);
    }

    header {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);

        div {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    }

    section {
        position: sticky;
        top: env(safe-area-inset-top);
        background-color: var(--raisin-black);
    }

    .overflow {
        background-color: var(--raisin-black);
        top: 0;
        left: 0;
        right: 0;
        position: fixed;
        height: env(safe-area-inset-top);
    }

    .selected-count {
        font-size: var(--font-size-1);
        border: 1px solid var(--yellow);
        border-radius: var(--radius-round);
        padding: var(--size-1) var(--size-2);
        font-weight: var(--font-weight-7);
        background-color: hsl(var(--yellow-hsl) / 10%);
        width: fit-content;
        min-width: var(--size-3);
        justify-content: center;
        display: flex;
    }
</style>