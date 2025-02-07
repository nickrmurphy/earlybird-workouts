<script lang="ts">
  import {
    ActiveExerciseSet,
    Navbar,
    TimerButton,
    PageHeader,
    Page,
    InstructionsDrawer,
    NavbarButton,
  } from "$lib/components";
  import { IconExposurePlus1, IconInfoCircle } from "@tabler/icons-svelte";
  import { liveQuery } from "dexie";
  import { db } from "$lib/db";
  import { page } from "$app/state";
  import { globalState } from "$lib/state";

  let { data } = $props();

  let showInstructions = $state(false);
  let instructions = $derived(data.details.instructions);

  let sets = liveQuery(() =>
    db.historySets
      .where({ historyId: data.historyId, exerciseId: page.params.exerciseId })
      .toArray(),
  );

  async function addSet() {
    if ($sets?.length === 0) return;

    await db.historySets.add({
      historyId: $sets[0].historyId,
      exerciseId: $sets[0].exerciseId,
      count: $sets[0].count,
      weight: $sets[0].weight,
      historyExerciseId: $sets[0].historyExerciseId,
      isSuccess: false,
    });
  }
</script>

<Page>
  <PageHeader title={data.details.name}>
    {#snippet right()}
      <button onclick={() => (showInstructions = true)}>
        <IconInfoCircle size={24} color="var(--color-muted-foreground)" />
      </button>
    {/snippet}
  </PageHeader>
  {#each $sets || [] as set, idx}
    <ActiveExerciseSet
      setIndex={idx}
      reps={set.count}
      weight={set.weight}
      isComplete={set.isSuccess}
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
<InstructionsDrawer
  name="Instructions"
  instructions={instructions || []}
  bind:open={showInstructions}
/>
