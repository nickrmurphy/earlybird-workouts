<script lang="ts">
  import { addExercise, removeExercise } from "$lib/mutations";
  import {
    Navbar,
    Input,
    ExerciseSelectList,
    Page,
    PageHeader,
    Button,
    Tabs,
  } from "$lib/components";
  import { page } from "$app/state";
  import { services } from "$lib/stores/services.svelte.js";
  import { IconFilter, IconFilterEdit } from "@tabler/icons-svelte";
  import InstructionsDrawer from "$lib/components/InstructionsDrawer.svelte";

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
    <Tabs
      defaultValue={selectedOnly}
      onChange={(value) => (selectedOnly = value)}
      options={[
        {
          label: "All",
          value: false,
        },
        {
          label: `Selected (${selectedOptions.length})`,
          value: true,
        },
      ]}
    />
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

<InstructionsDrawer
  bind:open={showDrawer}
  name={exerciseDetails.name}
  instructions={exerciseDetails.instructions}
>
  {#snippet footer()}
    <Button
      variant="outline"
      style="width: 100%"
      onclick={async () => {
        selectedOptions.includes(exerciseDetails.id)
          ? await removeExercise(data.workout.id, exerciseDetails.id)
          : await addExercise(data.workout.id, exerciseDetails.id);
        showDrawer = false;
      }}
    >
      {#if selectedOptions.includes(exerciseDetails.id)}
        Remove
      {:else}
        Select
      {/if}
    </Button>
  {/snippet}
</InstructionsDrawer>

<style>
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
