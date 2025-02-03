<script lang="ts">
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
  import { IconFilter, IconFilterEdit } from "@tabler/icons-svelte";
  import { InstructionsDrawer } from "$lib/components";
  import type { Exercise } from "$lib/schema";
  import { liveQuery } from "dexie";
  import { db } from "$lib/db/index.js";

  let { data } = $props();

  // TODO: Move all this search state into a separate store / class / function

  let filterQuery = $state("");
  let selectedOnly = $state(false);
  let searchFilters: string[] = $state([]);
  let exerciseDetails: { id: string; name: string; instructions: string[] } =
    $state({
      id: "",
      name: "",
      instructions: [],
    });
  let showDrawer = $state(false);

  let workoutExercises = liveQuery(() => {
    return db.workoutExercises
      .where("workoutId")
      .equals(parseInt(page.params.workoutId))
      .toArray();
  });

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

  function getExerciseDetailsFromId(id: string) {
    const exercise = data.allExercises.find((exercise) => exercise.id === id);

    // TODO: Handle undefined better
    exerciseDetails = exercise ?? { id: "", name: "", instructions: [] };
  }

  let exerciseOptions = $derived.by(() => {
    if (selectedOnly) {
      return data.allExercises.filter((exercise) =>
        $workoutExercises?.map((e) => e.exerciseId).includes(exercise.id),
      );
    }

    return data.allExercises.filter((exercise) => {
      const nameFilter = filterQuery.trim();
      let nameMatch = true;
      let muscleMatch = true;
      let equipmentMatch = true;

      if (nameFilter) {
        nameMatch = exercise.name
          .toLowerCase()
          .includes(nameFilter.toLowerCase());
      }

      if (searchFilters.length > 0) {
        const { muscleIds, equipmentIds } = getFilters();

        if (muscleIds.length > 0) {
          muscleMatch = muscleIds.some(
            (muscleId) =>
              // TODO: Remove type casting
              exercise.primaryMuscles.includes(
                muscleId as Exercise["primaryMuscles"][0],
              ) ||
              exercise.secondaryMuscles.includes(
                muscleId as Exercise["secondaryMuscles"][0],
              ),
          );
        }

        if (equipmentIds.length > 0) {
          equipmentMatch = equipmentIds.some((equipmentId) =>
            exercise.equipment?.includes(equipmentId),
          );
        }
      }

      return nameMatch && muscleMatch && equipmentMatch;
    });
  });

  const handleAddExercise = (value: string) => {
    const exercise = data.allExercises.find(
      (exercise) => exercise.id === value,
    );

    if (!exercise) return; //TODO: Handle better

    db.workoutExercises.add({
      name: exercise.name,
      workoutId: parseInt(page.params.workoutId),
      exerciseId: exercise.id,
      weight: 40,
      sets: 3,
      count: 10,
      order: $workoutExercises?.length ?? 0,
    });
  };

  const handleRemoveExercise = (value: string) => {
    db.workoutExercises.where("exerciseId").equals(value).delete();
  };
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
          label: `Selected (${$workoutExercises?.length})`,
          value: true,
        },
      ]}
    />
  </PageHeader>

  <ExerciseSelectList
    selected={$workoutExercises?.map((exercise) => exercise.exerciseId)}
    options={exerciseOptions.map((exercise) => ({
      value: exercise.id,
      label: exercise.name,
    }))}
    onAdd={(value) => {
      handleAddExercise(value);
    }}
    onRemove={(value) => {
      handleRemoveExercise(value);
    }}
    onSelectInfo={(value) => {
      getExerciseDetailsFromId(value);
      showDrawer = true;
    }}
  />
</Page>

<Navbar
  backHref={`/${page.params.workoutId}`}
  backAsComplete={page.url.searchParams.has("complete")}
>
  <label
    class="border-muted-foreground text-muted-foreground flex min-h-11 w-full flex-1 items-center gap-3 rounded-sm border pl-3"
  >
    <span>
      {#if searchFilters.length > 0}
        <IconFilterEdit />
      {:else}
        <IconFilter />
      {/if}
    </span>
    <select
      bind:value={searchFilters}
      multiple
      class="focus-within:outline-none"
    >
      <optgroup label="Muscles">
        {#each data.allMuscleGroups as muscleGroup}
          <option value="muscle-{muscleGroup.value}">{muscleGroup.label}</option
          >
        {/each}
      </optgroup>
      <optgroup label="Equipment">
        <option value="equipment-NULL">None</option>
        {#each data.allEquipment as equipment}
          <option value="equipment-{equipment.value}">{equipment.label}</option>
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
      onclick={async () => {
        $workoutExercises?.map((e) => e.exerciseId).includes(exerciseDetails.id)
          ? handleRemoveExercise(exerciseDetails.id)
          : handleAddExercise(exerciseDetails.id);
        showDrawer = false;
      }}
    >
      {#if $workoutExercises
        ?.map((e) => e.exerciseId)
        .includes(exerciseDetails.id)}
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
    background: none;
    width: 100%;
    min-height: 44px;
  }
</style>
