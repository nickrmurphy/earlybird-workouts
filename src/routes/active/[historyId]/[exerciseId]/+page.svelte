<script lang="ts">
  import {
    ActiveExerciseSet,
    Navbar,
    TimerButton,
    PageHeader,
    Page,
    InstructionsDrawer,
    NavbarButton,
    Drawer,
    Input,
    WeightUnitSelect,
  } from "$lib/components";
  import {
    IconExposurePlus1,
    IconInfoCircle,
    IconPencil,
    IconTrash,
  } from "@tabler/icons-svelte";
  import { db } from "$lib/db";
  import { globalState } from "$lib/state";
  import Button from "$lib/components/ui/Button.svelte";
  import type { WeightUnit } from "$lib/database/database.js";

  let { data } = $props();

  let showInstructions = $state(false);
  let showEdit = $state(false);
  let instructions = $derived(data.details.instructions);

  function updateSetUnit(setId: string, unit: WeightUnit) {
    db.historySets.update(setId, { weightUnit: unit });
  }

  function deleteSet(setId: string) {
    db.historySets.delete(setId);
  }

  async function addSet() {
    if (data.activitySets.length === 0) return;

    await db.historySets.add({
      historyId: data.activitySets[0].activityId,
      exerciseId: data.activitySets[0].exerciseId,
      count: data.activitySets[0].count,
      weight: data.activitySets[0].weight,
      historyExerciseId: "",
      weightUnit: "lbs",
      countUnit: "reps",
      isSuccess: false,
    });
  }
</script>

<Page>
  <PageHeader title={data.details.exerciseName}>
    {#snippet right()}
      <button onclick={() => (showEdit = true)}>
        <IconPencil class="text-muted-foreground size-6" />
      </button>
      <button onclick={() => (showInstructions = true)}>
        <IconInfoCircle class="text-muted-foreground size-6" />
      </button>
    {/snippet}
  </PageHeader>
  {#each data.activitySets as set, idx (set.id)}
    <ActiveExerciseSet
      setIndex={idx}
      reps={set.count}
      weight={set.weight}
      isComplete={set.isComplete}
      weightUnit={set.weightUnit}
      onToggleComplete={(isComplete) => {
        if (isComplete) {
          globalState.activity.restTimer.stop();
          globalState.activity.restTimer.start();
        }
        db.historySets.update(set.id, { isSuccess: !!isComplete });
      }}
      onRepsChange={(reps) => {
        db.historySets.update(set.id, { count: reps });
      }}
      onWeightChange={(weight) => {
        db.historySets.update(set.id, { weight });
      }}
    />
  {/each}
</Page>
<Navbar backHref={`/active/${data.activity.id}`}>
  <TimerButton
    onclick={() => globalState.activity.restTimer.toggle()}
    elapsedTime={globalState.activity.restTimer.elapsedTime}
    runTimeSeconds={globalState.activity.restTimer.runTimeSeconds}
    isRunning={globalState.activity.restTimer.isRunning}
    isExpired={globalState.activity.restTimer.isExpired}
  />
  <NavbarButton variant="secondary" onclick={addSet}>
    <IconExposurePlus1 />
  </NavbarButton>
</Navbar>
<Drawer bind:open={showEdit} title="Edit sets">
  <p class="text-muted-foreground">Edit units or remove sets.</p>
  {#each data.activitySets as set, idx (set.id)}
    <div class="space-y-4 p-2">
      <div class="text-muted-foreground tracking-wider uppercase">
        Set {idx + 1}
      </div>
      <div class="grid grid-cols-8 gap-2">
        <Input
          class="text-muted-foreground col-span-4"
          readonly
          value="{set.count} reps x {set.weight} {set.weightUnit}"
        />
        <WeightUnitSelect
          class="col-span-3"
          value={set.weightUnit}
          onchange={(unit) => updateSetUnit(set.id, unit)}
        />
        <Button
          class="col-span-1 w-fit! text-red-500!"
          variant="outline"
          disabled={data.activitySets.length === 1}
          onclick={() => deleteSet(set.id)}
        >
          <IconTrash />
        </Button>
      </div>
    </div>
  {/each}
</Drawer>
<InstructionsDrawer
  name="Instructions"
  instructions={instructions || []}
  bind:open={showInstructions}
/>
