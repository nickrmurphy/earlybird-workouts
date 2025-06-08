<script lang="ts">
  import { IconFilter, IconFilterEdit } from "@tabler/icons-svelte";
  import {
    equipmentSchema,
    muscleSchema,
    type Equipment,
    type Muscle,
    type DiscreteMuscle,
    type DiscreteEquipment,
  } from "$lib/db";

  let {
    muscleOptions,
    equipmentOptions,
    selectedMuscles = $bindable([]),
    selectedEquipment = $bindable([]),
  }: {
    muscleOptions: DiscreteMuscle[];
    equipmentOptions: DiscreteEquipment[];
    selectedMuscles: Muscle[];
    selectedEquipment: Equipment[];
  } = $props();

  let searchFilters: string[] = $state([]);

  function getFilters(): { muscleIds: Muscle[]; equipmentIds: Equipment[] } {
    if (searchFilters.length === 0) {
      return { muscleIds: [], equipmentIds: [] };
    }

    let muscleIds: Muscle[] = [];
    let equipmentIds: Equipment[] = [];

    for (const filter of searchFilters) {
      if (filter.startsWith("muscle-")) {
        muscleIds.push(muscleSchema.parse(filter.replace("muscle-", "")));
      } else if (filter.startsWith("equipment-")) {
        equipmentIds.push(
          equipmentSchema.parse(filter.replace("equipment-", "")),
        );
      }
    }

    return { muscleIds, equipmentIds };
  }

  $effect(() => {
    const { muscleIds, equipmentIds } = getFilters();
    selectedMuscles = muscleIds;
    selectedEquipment = equipmentIds;
  });
</script>

<label
  class="border-muted-foreground text-muted-foreground flex min-h-11 w-full flex-1 items-center gap-3 rounded-sm border pl-3"
>
  <span>
    {#if searchFilters.length > 0}
      <IconFilterEdit />
    {:else}
      <IconFilter />
    {/if}
  </span>
  <select
    bind:value={searchFilters}
    multiple
    class="min-h-11 w-full border-none bg-transparent focus-within:outline-none"
  >
    <optgroup label="Muscles">
      {#each muscleOptions as muscle (muscle.value)}
        <option value="muscle-{muscle.value}">{muscle.label}</option>
      {/each}
    </optgroup>
    <optgroup label="Equipment">
      <option value="equipment-NULL">None</option>
      {#each equipmentOptions as equipment (equipment.value)}
        <option value="equipment-{equipment.value}">{equipment.label}</option>
      {/each}
    </optgroup>
  </select>
</label>
