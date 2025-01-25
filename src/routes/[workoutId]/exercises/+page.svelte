<script lang="ts">
  import { addExercise, removeExercise } from "$lib/mutations";
  import {
    Navbar,
    Input,
    ExerciseSelectList,
    Page,
    PageHeader,
    Drawer,
    Button,
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
  let exerciseDetails: { id: string; name: string; instructions: string[] } =
    $state({
      id: "",
      name: "",
      instructions: [],
    });
  let showDrawer = $state(false);

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

  async function getExerciseDetailsFromId(id: string) {
    const details = await services.exercise.getExercise(id);
    const instructions = await services.exercise.getExerciseInstructions(id);
    console.log(details, instructions);

    exerciseDetails = {
      id: details.id,
      name: details.name,
      instructions: instructions.map((instruction) => instruction.instruction),
    };
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
    onSelectInfo={async (value) => {
      await getExerciseDetailsFromId(value);
      showDrawer = true;
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
<Drawer bind:open={showDrawer} title={exerciseDetails.name}>
  <ol>
    {#each exerciseDetails.instructions as instruction, idx}
      <li>
        <span>{idx + 1}.</span>
        {instruction}
      </li>
    {/each}
  </ol>
  <div style="margin-top: auto; margin-bottom: env(safe-area-inset-bottom)">
    {#if selectedOptions.includes(exerciseDetails.id)}
      <Button
        variant="outline"
        style="width: 100%"
        onclick={async () => {
          await removeExercise(data.workout.id, exerciseDetails.id);
          showDrawer = false;
        }}
      >
        Remove
      </Button>
    {:else}
      <Button
        variant="outline"
        style="width: 100%"
        onclick={async () => {
          await addExercise(data.workout.id, exerciseDetails.id);
          showDrawer = false;
        }}
      >
        Select
      </Button>
    {/if}
  </div>
</Drawer>

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

  ol {
    display: flex;
    flex-direction: column;
    gap: var(--size-2);
    padding: var(--size-2);

    li {
      font-size: var(--font-size-2);
      line-height: var(--font-lineheight-4);
      span {
        font-weight: var(--font-weight-7);
      }
    }
  }
</style>
