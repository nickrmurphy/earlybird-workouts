<script lang="ts">
  import { goto } from "$app/navigation";
  import { SportsJogging } from "$lib/assets";
  import {
    WorkoutCard,
    EmptyMessage,
    Pressable,
    Page,
    PageHeader,
    InputDialog,
    Navbar,
    NavbarButton,
    SettingsDrawer,
  } from "$lib/components";
  import {
    IconCirclePlus,
    IconReportAnalytics,
    IconSettings,
  } from "@tabler/icons-svelte";

  let showModal = $state(false);
  let showSettings = $state(false);
  import { liveQuery, type Observable } from "dexie";
  import { db } from "$lib/db";
  import { getWorkoutsInfo } from "$lib/db/queries";

  type WorkoutInfo = {
    id: string;
    name: string;
    exercises: string[];
  };

  let workoutInfo: Observable<WorkoutInfo[]> = liveQuery(() =>
    getWorkoutsInfo(),
  );

  const createWorkout = async (name: string) => {
    if (!name) return;
    db.workouts.add({ name }).then((newId) => {
      goto(`/${newId}/exercises?complete=true`);
    });
  };
</script>

<Page>
  <PageHeader title="Workouts">
    {#snippet right()}
      <button onclick={() => (showModal = true)}>
        <IconCirclePlus class="text-accent" size={24} />
      </button>
    {/snippet}
  </PageHeader>
  <section class="flex flex-col gap-4 overflow-scroll">
    {#if $workoutInfo?.length === 0}
      <EmptyMessage
        header="No workouts yet."
        message="Tap the plus button to add one."
      />
      <SportsJogging />
    {:else}
      {#each $workoutInfo as workout (workout.id)}
        <Pressable href={`/${workout.id}`}>
          <WorkoutCard
            workoutName={workout.name}
            exercises={workout.exercises}
          />
        </Pressable>
      {/each}
    {/if}
  </section>

  <Navbar>
    <NavbarButton class="invisible"></NavbarButton>
    <NavbarButton
      class="w-full"
      variant="secondary"
      onclick={() => goto("/history")}
    >
      History
      <IconReportAnalytics />
    </NavbarButton>
    <NavbarButton variant="secondary" onclick={() => (showSettings = true)}>
      <IconSettings />
    </NavbarButton>
  </Navbar>
</Page>

<SettingsDrawer bind:open={showSettings} />

<InputDialog
  bind:open={showModal}
  title="Create a workout"
  onSubmit={createWorkout}
  submitText="Create"
  placeholder="e.g. Upper Body"
/>
