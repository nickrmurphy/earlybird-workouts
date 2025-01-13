<script lang="ts">
  import { addExercise, removeExercise } from "$lib/mutations";
  import {
    PageHeader,
    Navbar,
    Input,
    ExerciseSelectList,
  } from "$lib/components";
  import { goto } from "$app/navigation";
  import { page } from "$app/state";
  import { debounce } from "$lib/utils";

  let { data } = $props();

  let filterQuery = $state("");
  let selectedOnly = $state(false);
  let selectedOptions = $derived(data.exercises.map((exercise) => exercise.id));
  let searchParams = $state(page.url.searchParams);
  let equipmentFilter = $state(-1);
  let muscleGroupFilter = $state(-1);

  $effect(() => {
    if (equipmentFilter > 0) {
      searchParams.set("equipmentId", equipmentFilter.toString());
    } else {
      searchParams.delete("equipmentId");
    }
    goto(`?${searchParams.toString()}`);
  });

  $effect(() => {
    if (muscleGroupFilter > 0) {
      searchParams.set("muscleGroupId", muscleGroupFilter.toString());
    } else {
      searchParams.delete("muscleGroupId");
    }
    goto(`?${searchParams.toString()}`);
  });

  const updateFilterQuery = debounce(function updateFilterQuery(name?: string) {
    if (name) {
      searchParams.set("name", name);
    } else {
      searchParams.delete("name");
    }
    goto(`?${searchParams.toString()}`);
  }, 750);

  let exerciseOptions = $derived.by(() => {
    let filteredExercises = selectedOnly
      ? data.queriedExercises?.filter((exercise) =>
          selectedOptions.includes(exercise.id),
        ) || []
      : data.queriedExercises;

    return (
      filteredExercises?.map((exercise) => ({
        value: exercise.id,
        label: exercise.name,
      })) || []
    );
  });
</script>

<PageHeader>
  {#snippet control()}
    <Input
      bind:value={filterQuery}
      type="search"
      oninput={(e) => updateFilterQuery(e.currentTarget.value)}
      placeholder="Search for an exercise..."
      enterkeyhint="search"
    />
    <div class="tab-group">
      <button
        onclick={() => (selectedOnly = false)}
        data-selected={!selectedOnly}>All</button
      >
      <button
        onclick={() => (selectedOnly = true)}
        data-selected={selectedOnly}
      >
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
<Navbar backHref={`/${data.workout.id}`}>
  <select bind:value={equipmentFilter}>
    <option value={-1}>All equipment</option>
    {#each data.allEquipment as equipment}
      <option value={equipment.id}>{equipment.name}</option>
    {/each}
  </select>
  <select bind:value={muscleGroupFilter}>
    <option value={-1}>All muscle groups</option>
    {#each data.allMuscleGroups as muscleGroup}
      <option value={muscleGroup.id}>{muscleGroup.name}</option>
    {/each}
  </select>
</Navbar>

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
    border: 1px solid var(--border-color);
    border-radius: var(--radius-3);
    padding: var(--size-1);

    button {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: var(--size-3);
      border-radius: var(--radius-round);
      padding: var(--size-1) var(--size-2);
      width: 100%;
      color: hsl(var(--magnolia-hsl / 70%));
      font-weight: var(--font-weight-5);
      text-align: center;
    }

    button[data-selected="true"] {
      background-color: hsl(var(--yellow-hsl) / 90%);
      color: hsl(var(--black-hsl) / 80%);
      font-weight: var(--font-weight-7);
    }
  }

  select {
    border: 1px solid var(--border-color);
    border-radius: var(--radius-round);
    background: none;
    padding: var(--size-2) var(--size-3);
    width: 100%;
    min-height: 44px;
    color: var(--black);
    font-size: var(--font-size-0);
  }

  select:focus {
    outline: 2px solid var(--primary-color);
    outline-offset: 2px;
  }
</style>
