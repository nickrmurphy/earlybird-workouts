<script lang="ts">
  import ExerciseSelectList from "../../../ExerciseSelectList.svelte";
  import Input from "../../../Input.svelte";
  import { addExercise, removeExercise } from "$lib/workoutActions";
  import { PageHeader, Navbar } from "$lib/components/page";

  let { data } = $props();

  let filterQuery = $state("");
  let selectedOnly = $state(false);
  let selectedOptions = $derived(data.exercises.map((exercise) => exercise.id));

  let exerciseOptions = $derived.by(() => {
      let filteredExercises = filterQuery === ""  ? data.allExercises : data.allExercises?.filter((exercise) =>
          exercise.name.toLowerCase().includes(filterQuery.toLowerCase())
      );  

      if (selectedOnly) {
        filteredExercises = filteredExercises?.filter((exercise) => selectedOptions.includes(exercise.id)) || [];
      }

      return filteredExercises?.map((exercise) => ({
          value: exercise.id,
          label: exercise.name,
      })) || [];
  });
    
</script>


<PageHeader>
    {#snippet control()}
        <Input bind:value={filterQuery} placeholder="Search for an exercise..." />
        <div class="tab-group">
            <button onclick={() => selectedOnly = false} data-selected={!selectedOnly}>All</button>
            <button onclick={() => selectedOnly = true} data-selected={selectedOnly}>
                Selected
                <span class="selected-count">({selectedOptions.length})</span>
            </button>
        </div>
    {/snippet}
</PageHeader>
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
<Navbar backHref={`/${data.workout.id}`} backLabel={data.workout.name}/>
<style>

    main {
        padding: var(--size-2);
        padding-bottom: var(--navbar-height);
    }

    .selected-count {
        font-size: var(--font-size-0);
    }

    .tab-group {
        display: flex;
        gap: var(--size-1);
        border: 1px solid hsl(var(--magnolia-hsl) / 50%);
        border-radius: var(--radius-3);
        padding: var(--size-1);

        button {
            border-radius: var(--radius-round);
            padding: var(--size-1) var(--size-2);
            width: 100%;
            text-align: center;
            font-weight: var(--font-weight-5);
            color: hsl(var(--magnolia-hsl / 70%));
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--size-3);
        }
        
        button[data-selected=true] {
            background-color:  hsl(var(--yellow-hsl) / 90%);
            color: var(--raisin-black);
            font-weight: var(--font-weight-7);
        }
    }
</style>