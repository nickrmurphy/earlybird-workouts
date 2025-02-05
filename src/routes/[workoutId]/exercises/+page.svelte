<script lang="ts">
  import {
    Navbar,
    Input,
    ExerciseSelectList,
    Page,
    PageHeader,
    Tabs,
    ExerciseSelectFilters,
  } from "$lib/components";
  import { page } from "$app/state";
  import { InstructionsDrawerSelect } from "$lib/components";
  import { liveQuery } from "dexie";
  import { db } from "$lib/db/index.js";
  import { ExerciseSearch } from "$lib/stores";

  let { data } = $props();

  let selectedOnly = $state(false);

  let exerciseDetails:
    | { id: string; name: string; instructions: string[] }
    | undefined = $state({
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

  const exerciseSearch = new ExerciseSearch(data.allExercises);
  let selectedExerciseDetails = $derived.by(() => {
    return data.allExercises.filter((exercise) =>
      $workoutExercises?.map((e) => e.exerciseId).includes(exercise.id),
    );
  });

  let exerciseOptions = $derived.by(() => {
    const options = selectedOnly
      ? selectedExerciseDetails
      : exerciseSearch.filteredOptions;

    return options.map((exercise) => ({
      value: exercise.id,
      label: exercise.name,
    }));
  });

  function getExerciseDetailsFromId(id: string) {
    exerciseDetails = data.allExercises.find((exercise) => exercise.id === id);
  }

  const handleAddExercise = (value: string) => {
    const exercise = data.allExercises.find(
      (exercise) => exercise.id === value,
    );

    if (!exercise) return;

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
      bind:value={exerciseSearch.searchTerm}
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
    options={exerciseOptions}
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
  <ExerciseSelectFilters
    muscleOptions={data.allMuscleGroups}
    equipmentOptions={data.allEquipment}
    bind:selectedMuscles={exerciseSearch.muscleIdFilters}
    bind:selectedEquipment={exerciseSearch.equipmentIdFilters}
  />
</Navbar>
{#if exerciseDetails}
  <InstructionsDrawerSelect
    bind:open={showDrawer}
    name={exerciseDetails.name}
    exerciseId={exerciseDetails.id}
    isSelected={$workoutExercises
      ?.map((e) => e.exerciseId)
      .includes(exerciseDetails.id)}
    instructions={exerciseDetails.instructions}
    onAddExercise={handleAddExercise}
    onRemoveExercise={handleRemoveExercise}
  />
{/if}
