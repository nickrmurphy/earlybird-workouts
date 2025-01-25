<script lang="ts">
  import { addExercise, removeExercise } from "$lib/mutations";
  import {
    Navbar,
    Input,
    ExerciseSelectList,
    Page,
    PageHeader,
  } from "$lib/components";
  import { page } from "$app/state";
  import { services } from "$lib/stores/services.svelte.js";
  import { IconFilter, IconFilterEdit } from "@tabler/icons-svelte";

  type Exercise = {
    id: string;
    name: string;
    description: string;
  };

  let { data } = $props();
  let filterQuery = $state("");
  let selectedOnly = $state(false);
  let selectedOptions = $derived(data.exercises.map((exercise) => exercise.id));
  let searchFilters: string[] = $state([]);
  let queriedExercises: Exercise[] = $state([]);

  function getFilters(): { muscleIds: string[]; equipmentIds: string[] } {
    if (searchFilters.length === 0) {
      return { muscleIds: [], equipmentIds: [] };
    }

    let muscleIds: string[] = [];
    let equipmentIds: string[] = [];

    for (const filter of searchFilters) {
      if (filter.startsWith("muscle-")) {
        muscleIds.push(filter.replace("muscle-", ""));
      } else if (filter.startsWith("equipment-")) {
        equipmentIds.push(filter.replace("equipment-", ""));
      }
    }

    return { muscleIds, equipmentIds };
  }

  $effect(() => {
    services.exercise
      .queryExercises({
        name: filterQuery.trim(),
        ...getFilters(),
      })
      .then((exercises) => {
        queriedExercises = exercises;
      });
  });

  let exerciseOptions = $derived.by(() => {
    let filteredExercises = selectedOnly
      ? queriedExercises?.filter((exercise) =>
          selectedOptions.includes(exercise.id),
        ) || []
      : queriedExercises;

    return (
      filteredExercises?.map((exercise) => ({
        value: exercise.id,
        label: exercise.name,
        description: exercise.description,
      })) || []
    );
  });
</script>

<Page>
  <PageHeader>
    <Input
      bind:value={filterQuery}
      type="search"
      placeholder="Search for an exercise..."
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
  </PageHeader>

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
</Page>

<Navbar
  backHref={`/${data.workout.id}`}
  backAsComplete={page.url.searchParams.has("complete")}
>
  <label>
    <span>
      {#if searchFilters.length > 0}
        <IconFilterEdit />
      {:else}
        <IconFilter />
      {/if}
    </span>
    <select bind:value={searchFilters} multiple>
      <optgroup label="Muscles">
        {#each data.allMuscleGroups as muscleGroup}
          <option value="muscle-{muscleGroup.id}">{muscleGroup.name}</option>
        {/each}
      </optgroup>
      <optgroup label="Equipment">
        <option value="equipment-NULL">None</option>
        {#each data.allEquipment as equipment}
          <option value="equipment-{equipment.id}">{equipment.name}</option>
        {/each}
      </optgroup>
    </select>
  </label>
</Navbar>

<style>
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
      color: hsl(var(--white-hsl) / 70%);
      font-weight: var(--font-weight-5);
      text-align: center;
    }

    button[data-selected="true"] {
      background-color: var(--secondary);
      color: var(--foreground);
      font-weight: var(--font-weight-7);
    }
  }

  select {
    border: none;
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

  label {
    display: flex;
    align-items: center;
    gap: var(--size-3);
    border: 1px solid var(--border-color);
    border-radius: var(--radius-round);
    background: none;
    padding-left: var(--size-3);
    width: 100%;
    min-height: 44px;
    color: var(--black);
    font-size: var(--font-size-0);

    :global(svg) {
      width: var(--size-4);
      height: var(--size-4);
    }
  }
</style>
