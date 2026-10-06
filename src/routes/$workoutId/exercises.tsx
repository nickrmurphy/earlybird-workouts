import {
  EmptyMessage,
  ExerciseSelectFilters,
  ExerciseSelectList,
  InstructionsDrawerSelect,
  Page,
  PageHeader,
  Sheet,
  Toolbar,
} from "$lib/components";
import { db } from "$lib/db";
import { Button, Input } from "$lib/eb";
import { useExerciseSearch } from "$lib/state";
import { arraymove, getDefaultWeightUnit } from "$lib/utils";
import { CaretDownIcon, CaretUpIcon, MinusCircleIcon, PlusIcon } from "@phosphor-icons/react";
import { createFileRoute, getRouteApi } from "@tanstack/react-router";
import { useLiveQuery } from "dexie-react-hooks";
import { useMemo, useState } from "react";

type Search = {
  /** Open the add sheet straight away, e.g. right after creating a workout */
  add?: boolean;
};

// Exercise data is loaded once by the parent /$workoutId route
const workoutRoute = getRouteApi("/$workoutId");

export const Route = createFileRoute("/$workoutId/exercises")({
  validateSearch: (search: Record<string, unknown>): Search => ({
    add: search.add === true || search.add === "true" ? true : undefined,
  }),
  component: EditExercises,
});

function EditExercises() {
  const { workoutId } = Route.useParams();
  const { add } = Route.useSearch();
  const { allExercises, allMuscles, allEquipment } = workoutRoute.useLoaderData();

  const search = useExerciseSearch(allExercises);
  const [addOpen, setAddOpen] = useState(add ?? false);
  const [infoId, setInfoId] = useState<string | null>(null);
  const [infoOpen, setInfoOpen] = useState(false);

  const workout = useLiveQuery(() => db.workouts.get(workoutId), [workoutId]);
  const workoutExercises = useLiveQuery(
    () => db.workoutExercises.where("workoutId").equals(workoutId).sortBy("order"),
    [workoutId],
  );

  const selectedIds = useMemo(
    () => workoutExercises?.map((e) => e.exerciseId) ?? [],
    [workoutExercises],
  );

  const options = useMemo(
    () => search.filteredOptions.map((e) => ({ value: e.id, label: e.name })),
    [search.filteredOptions],
  );

  const infoExercise = allExercises.find((e) => e.id === infoId);

  function addExercise(exerciseId: string) {
    const exercise = allExercises.find((e) => e.id === exerciseId);
    if (!exercise) return;

    // After the current last exercise, even if earlier ones were removed
    const lastOrder = Math.max(-1, ...(workoutExercises?.map((e) => e.order) ?? []));

    db.workoutExercises.add({
      name: exercise.name,
      workoutId,
      exerciseId: exercise.id,
      weight: 40,
      sets: 3,
      count: 10,
      order: lastOrder + 1,
      weightUnit: getDefaultWeightUnit(),
      countUnit: "reps",
    });
  }

  function removeExercise(exerciseId: string) {
    db.workoutExercises.where({ workoutId, exerciseId }).delete();
  }

  async function move(from: number, to: number) {
    if (!workoutExercises) return;
    const next = [...workoutExercises];
    arraymove(next, from, to);

    // Renumber everything, so older workouts with gaps or ties end up in order
    await db.transaction("rw", [db.workoutExercises], async (tx) => {
      for (let i = 0; i < next.length; i++) {
        await tx.workoutExercises.update(next[i].id, { order: i });
      }
    });
  }

  return (
    <Page>
      <PageHeader title={workout?.name} backHref={`/${workoutId}`}>
        <p className="text-accent font-semibold">Exercises</p>
      </PageHeader>

      {workoutExercises?.length === 0 && (
        <EmptyMessage header="No exercises yet." message="Add some to build this workout." />
      )}
      <ol className="divide-muted divide-y">
        {workoutExercises?.map((exercise, idx) => (
          <li key={exercise.id} className="flex items-center gap-2 py-3">
            <span className="min-w-0 flex-1 text-base font-semibold">{exercise.name}</span>
            <Button
              variant="ghost"
              iconOnly
              aria-label={`Move ${exercise.name} up`}
              disabled={idx === 0}
              onClick={() => move(idx, idx - 1)}
            >
              <CaretUpIcon />
            </Button>
            <Button
              variant="ghost"
              iconOnly
              aria-label={`Move ${exercise.name} down`}
              disabled={idx === workoutExercises.length - 1}
              onClick={() => move(idx, idx + 1)}
            >
              <CaretDownIcon />
            </Button>
            <Button
              variant="ghost"
              iconOnly
              aria-label={`Remove ${exercise.name}`}
              className="text-danger"
              onClick={() => db.workoutExercises.delete(exercise.id)}
            >
              <MinusCircleIcon />
            </Button>
          </li>
        ))}
      </ol>

      <Toolbar>
        <Button
          variant="primary"
          className="flex-1"
          icon={<PlusIcon />}
          onClick={() => setAddOpen(true)}
        >
          Add exercises
        </Button>
      </Toolbar>

      <Sheet open={addOpen} onOpenChange={setAddOpen} title="Add exercises" className="h-[85dvh]">
        {/* Search stays put while the results scroll; -top-8 offsets the drawer padding */}
        <div className="bg-background sticky -top-8 z-1 -mx-8 flex items-center gap-2 px-8 py-2">
          <Input
            className="min-w-0 flex-1"
            type="search"
            aria-label="Search exercises"
            placeholder="Search exercises"
            value={search.term}
            onChange={(event) => search.setTerm(event.currentTarget.value)}
          />
          <ExerciseSelectFilters
            muscleOptions={allMuscles}
            equipmentOptions={allEquipment}
            selectedMuscles={search.muscleIds}
            selectedEquipment={search.equipmentIds}
            onMusclesChange={search.setMuscleIds}
            onEquipmentChange={search.setEquipmentIds}
          />
        </div>
        {options.length === 0 && (
          <EmptyMessage header="No matches." message="Try another search or clear the filters." />
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
      </Sheet>

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
