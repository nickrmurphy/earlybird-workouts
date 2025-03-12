<script lang="ts">
  import { IconFilter, IconFilterEdit } from "@tabler/icons-svelte";
  import {
    equipmentSchema,
    muscleSchema,
    type Equipment,
    type Muscle,
  } from "$lib/db";

  type Option = { id: string; name: string };

  let {
    muscleOptions,
    equipmentOptions,
    selectedMuscles = $bindable([]),
    selectedEquipment = $bindable([]),
  }: {
    muscleOptions: Option[];
    equipmentOptions: Option[];
    selectedMuscles: string[];
    selectedEquipment: string[];
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
      {#each muscleOptions as muscle (muscle.id)}
        <option value="muscle-{muscle.id}">{muscle.name}</option>
      {/each}
    </optgroup>
    <optgroup label="Equipment">
      <option value="equipment-NULL">None</option>
      {#each equipmentOptions as equipment (equipment.id)}
        <option value="equipment-{equipment.id}">{equipment.name}</option>
      {/each}
    </optgroup>
  </select>
</label>
