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
  import { db } from "$lib/db";
  import { ExerciseSearch } from "$lib/state";
  import { getDefaultWeightUnit } from "$lib/utils";
  import type { ExerciseDetail } from "$lib/resources/library.js";

  let { data } = $props();

  let showDrawer = $state(false);
  let selectedOnly = $state(false);
  let exerciseDetails: ExerciseDetail | undefined = $state(undefined);

  const exerciseSearch = new ExerciseSearch(data.allExercises);

  let selectedExerciseDetails = $derived.by(() => {
    return data.allExercises.filter((exercise) =>
      data.workoutExercises.map((e) => e.exerciseId).includes(exercise.id),
    );
  });

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

  const handleAddExercise = (value: string) => {
    const exercise = data.allExercises.find(
      (exercise) => exercise.id === value,
    );

    if (!exercise) return;

    db.workoutExercises.add({
      name: exercise.exerciseName,
      workoutId: page.params.workoutId,
      exerciseId: exercise.id,
      weight: 40,
      sets: 3,
      count: 10,
      order: data.workoutExercises.length,
      weightUnit: getDefaultWeightUnit(),
      countUnit: "reps",
    });
  };

  const handleRemoveExercise = (value: string) => {
    db.workoutExercises.where("exerciseId").equals(value).delete();
  };
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
