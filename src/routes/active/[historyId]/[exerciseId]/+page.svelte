<script lang="ts">
  import {
    ActiveExerciseSet,
    Navbar,
    TimerButton,
    PageHeader,
    Page,
  } from "$lib/components";
  import { ActivityStore } from "$lib/stores";
  import { IconExposurePlus1, IconInfoCircle } from "@tabler/icons-svelte";
  import { InstructionsDrawer } from "$lib/components";
  import { liveQuery } from "dexie";
  import { db } from "$lib/db/index.js";
  import { page } from "$app/state";
  import NavbarButton from "$lib/components/page/NavbarButton.svelte";

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
          ActivityStore.restTimer.stop();
          ActivityStore.restTimer.start();
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
    onclick={() => ActivityStore.restTimer.toggle()}
    elapsedTime={ActivityStore.restTimer.elapsedTime}
    runTimeSeconds={ActivityStore.restTimer.runTimeSeconds}
    isRunning={ActivityStore.restTimer.isRunning}
    isExpired={ActivityStore.restTimer.isExpired}
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
