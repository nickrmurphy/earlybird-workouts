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
  import { ExerciseSearch } from "$lib/state";
  import { getDefaultWeightUnit } from "$lib/utils";
  import type { ExerciseDetail } from "$lib/resources/library.js";
  import {
    createWorkoutExercise,
    deleteWorkoutExercise,
  } from "$lib/resources/workoutExercises.js";

  let { data } = $props();

  let showDrawer = $state(false);
  let selectedOnly = $state(false);
  let exerciseDetails: ExerciseDetail | undefined = $state(undefined);

  const exerciseSearch = new ExerciseSearch(data.allExercises);

  let selectedExerciseDetails = $derived.by(() =>
    data.allExercises.filter((exercise) =>
      data.workoutExercises.map((e) => e.exerciseId).includes(exercise.id),
    ),
  );

  let exerciseOptions = $derived.by(() => {
    const options = selectedOnly
      ? selectedExerciseDetails
      : exerciseSearch.filteredOptions;

    return options.map((exercise) => ({
      id: exercise.id,
      name: exercise.exerciseName,
    }));
  });

  function getExerciseDetailsFromId(id: string) {
    exerciseDetails = data.allExercises.find((exercise) => exercise.id === id);
  }

  const handleAddExercise = (id: string) => {
    const exercise = data.allExercises.find((exercise) => exercise.id === id);

    if (!exercise) {
      console.error("Exercise not found");
      return;
    }

    createWorkoutExercise({
      exerciseId: id,
      workoutId: page.params.workoutId,
      order: data.workoutExercises.length,
      sets: 3,
      weight: 40,
      weightUnit: getDefaultWeightUnit(),
      count: 10,
      countUnit: "rep",
    });
  };

  const handleRemoveExercise = (id: string) => deleteWorkoutExercise(id);
</script>

<Page>
  <PageHeader>
    <Input
      bind:value={exerciseSearch.term}
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
          label: `Selected (${data.workoutExercises.length})`,
          value: true,
        },
      ]}
    />
  </PageHeader>

  <ExerciseSelectList
    selected={data.workoutExercises.map((exercise) => exercise.exerciseId)}
    options={exerciseOptions}
    onAdd={handleAddExercise}
    onRemove={handleRemoveExercise}
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
    muscleOptions={data.allMuscles}
    equipmentOptions={data.allEquipment}
    bind:selectedMuscles={exerciseSearch.muscleIds}
    bind:selectedEquipment={exerciseSearch.equipmentIds}
  />
</Navbar>
{#if exerciseDetails}
  <InstructionsDrawerSelect
    bind:open={showDrawer}
    name={exerciseDetails.exerciseName}
    exerciseId={exerciseDetails.id}
    isSelected={data.workoutExercises
      .map((e) => e.exerciseId)
      .includes(exerciseDetails.id)}
    instructions={exerciseDetails.instructions}
    onAddExercise={handleAddExercise}
    onRemoveExercise={handleRemoveExercise}
  />
{/if}
