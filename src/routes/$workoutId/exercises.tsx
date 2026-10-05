import {
  EmptyMessage,
  ExerciseSelectFilters,
  ExerciseSelectList,
  InstructionsDrawerSelect,
  Navbar,
  Page,
  PageHeader,
} from "$lib/components";
import { db } from "$lib/db";
import { Input, SegmentedControl } from "$lib/eb";
import { useExerciseSearch } from "$lib/state";
import { getDefaultWeightUnit } from "$lib/utils";
import { createFileRoute, getRouteApi } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useMemo, useState } from "react";

type Search = {
  /** Show the back button as "done" (coming from workout creation) */
  complete?: boolean;
};

// Exercise data is loaded once by the parent /$workoutId route
const workoutRoute = getRouteApi("/$workoutId");

export const Route = createFileRoute("/$workoutId/exercises")({
  validateSearch: (search: Record<string, unknown>): Search => ({
    complete: search.complete === true || search.complete === "true" ? true : undefined,
  }),
  component: ExerciseSelection,
});

function ExerciseSelection() {
  const { workoutId } = Route.useParams();
  const { complete } = Route.useSearch();
  const { allExercises, allMuscles, allEquipment } = workoutRoute.useLoaderData();

  const search = useExerciseSearch(allExercises);
  const [view, setView] = useState<"all" | "selected">("all");
  const [infoId, setInfoId] = useState<string | null>(null);
  const [infoOpen, setInfoOpen] = useState(false);

  const workoutExercises = useLiveQuery(
    () => db.workoutExercises.where("workoutId").equals(workoutId).toArray(),
    [workoutId],
  );

  const selectedIds = useMemo(
    () => workoutExercises?.map((e) => e.exerciseId) ?? [],
    [workoutExercises],
  );

  const options = useMemo(() => {
    const exercises =
      view === "selected"
        ? allExercises.filter((e) => selectedIds.includes(e.id))
        : search.filteredOptions;
    return exercises.map((e) => ({ value: e.id, label: e.name }));
  }, [view, allExercises, selectedIds, search.filteredOptions]);

  const infoExercise = allExercises.find((e) => e.id === infoId);

  function addExercise(exerciseId: string) {
    const exercise = allExercises.find((e) => e.id === exerciseId);
    if (!exercise) return;

    db.workoutExercises.add({
      name: exercise.name,
      workoutId,
      exerciseId: exercise.id,
      weight: 40,
      sets: 3,
      count: 10,
      order: workoutExercises?.length ?? 0,
      weightUnit: getDefaultWeightUnit(),
      countUnit: "reps",
    });
  }

  function removeExercise(exerciseId: string) {
    db.workoutExercises.where({ workoutId, exerciseId }).delete();
  }

  return (
    <Page>
      <PageHeader>
        <Input
          type="search"
          aria-label="Search exercises"
          placeholder="Search exercises"
          value={search.term}
          onChange={(event) => search.setTerm(event.currentTarget.value)}
        />
        <SegmentedControl
          aria-label="Show"
          className="w-full [&>*]:flex-1"
          value={view}
          onValueChange={(value) => setView(value as "all" | "selected")}
          options={[
            { value: "all", label: "All" },
            { value: "selected", label: `Selected (${selectedIds.length})` },
          ]}
        />
      </PageHeader>

      {options.length === 0 && (
        <EmptyMessage
          header={view === "selected" ? "No exercises selected." : "No matches."}
          message={
            view === "selected"
              ? "Pick exercises from the All tab."
              : "Try another search or clear the filters."
          }
        />
      )}
      <ExerciseSelectList
        options={options}
        selected={selectedIds}
        onAdd={addExercise}
        onRemove={removeExercise}
        onSelectInfo={(id) => {
          setInfoId(id);
          setInfoOpen(true);
        }}
      />

      <Navbar backHref={`/${workoutId}`} backAsComplete={complete}>
        <ExerciseSelectFilters
          muscleOptions={allMuscles}
          equipmentOptions={allEquipment}
          selectedMuscles={search.muscleIds}
          selectedEquipment={search.equipmentIds}
          onMusclesChange={search.setMuscleIds}
          onEquipmentChange={search.setEquipmentIds}
        />
      </Navbar>

      {infoExercise && (
        <InstructionsDrawerSelect
          open={infoOpen}
          onOpenChange={setInfoOpen}
          name={infoExercise.name}
          exerciseId={infoExercise.id}
          instructions={infoExercise.instructions}
          isSelected={selectedIds.includes(infoExercise.id)}
          onAddExercise={addExercise}
          onRemoveExercise={removeExercise}
        />
      )}
    </Page>
  );
}
