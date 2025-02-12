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
    Select,
    Input,
    WeightUnitSelect,
  } from "$lib/components";
  import {
    IconCheck,
    IconCircle,
    IconCircleCheck,
    IconExposurePlus1,
    IconInfoCircle,
    IconPencil,
    IconTrash,
  } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";
  import { db, weightUnitSchema, type WeightUnit } from "$lib/db";
  import { page } from "$app/state";
  import { globalState } from "$lib/state";
  import Button from "$lib/components/ui/Button.svelte";
  import { parse } from "svelte/compiler";

  let { data } = $props();

  let showInstructions = $state(false);
  let showEdit = $state(false);
  let instructions = $derived(data.details.instructions);

  let sets = liveQuery(() =>
    db.historySets
      .where({ historyId: data.historyId, exerciseId: page.params.exerciseId })
      .toArray(),
  );

  function updateSetUnit(setId: string, unit: WeightUnit) {
    db.historySets.update(setId, { weightUnit: unit });
  }

  function deleteSet(setId: string) {
    db.historySets.delete(setId);
  }

  async function addSet() {
    if ($sets?.length === 0) return;

    await db.historySets.add({
      historyId: $sets[0].historyId,
      exerciseId: $sets[0].exerciseId,
      count: $sets[0].count,
      weight: $sets[0].weight,
      historyExerciseId: $sets[0].historyExerciseId,
      weightUnit: $sets[0].weightUnit,
      countUnit: $sets[0].countUnit,
      isSuccess: false,
    });
  }
</script>

<Page>
  <PageHeader title={data.details.name}>
    {#snippet right()}
      <button onclick={() => (showEdit = true)}>
        <IconPencil class="text-muted-foreground size-6" />
      </button>
      <button onclick={() => (showInstructions = true)}>
        <IconInfoCircle class="text-muted-foreground size-6" />
      </button>
    {/snippet}
  </PageHeader>
  {#each $sets || [] as set, idx}
    <ActiveExerciseSet
      setIndex={idx}
      reps={set.count}
      weight={set.weight}
      isComplete={set.isSuccess}
      weightUnit={set.weightUnit}
      onToggleComplete={(isComplete) => {
        if (isComplete) {
          globalState.activity.restTimer.stop();
          globalState.activity.restTimer.start();
        }
        db.historySets.update(set.id, { isSuccess: isComplete });
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
<Navbar backHref={`/active/${data.historyId}`}>
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
  <p class="text-muted-foreground p-2">Edit units or remove sets.</p>
  {#each $sets || [] as set, idx}
    <div class="space-y-4 p-2">
      <div class="text-muted-foreground tracking-wider uppercase">
        Set {idx + 1}
      </div>
      <div class="grid grid-cols-8 gap-2">
        <div class="col-span-1 flex items-center">
          {#if set.isSuccess}
            <IconCircleCheck />
          {:else}
            <IconCircle />
          {/if}
        </div>
        <Input
          class="text-muted-foreground col-span-4"
          readonly
          value="{set.count} reps x {set.weight} {set.weightUnit}"
        />
        <WeightUnitSelect
          class="col-span-2"
          value={set.weightUnit}
          onchange={(unit) => updateSetUnit(set.id, unit)}
        />
        <Button
          class="col-span-1 w-fit! text-red-500!"
          variant="outline"
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
