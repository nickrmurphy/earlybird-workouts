import type { DiscreteEquipment, DiscreteMuscle, Equipment, Muscle } from "$lib/db";
import { Button, Checkbox } from "$lib/eb";
import { FunnelIcon } from "@phosphor-icons/react";
import { useState } from "react";
import { Sheet } from "./Sheet";

type Props = {
  muscleOptions: DiscreteMuscle[];
  equipmentOptions: DiscreteEquipment[];
  selectedMuscles: Muscle[];
  selectedEquipment: Equipment[];
  onMusclesChange: (muscles: Muscle[]) => void;
  onEquipmentChange: (equipment: Equipment[]) => void;
};

function toggle<T>(list: T[], value: T, checked: boolean) {
  return checked ? [...list, value] : list.filter((item) => item !== value);
}

export function ExerciseSelectFilters({
  muscleOptions,
  equipmentOptions,
  selectedMuscles,
  selectedEquipment,
  onMusclesChange,
  onEquipmentChange,
}: Props) {
  const [open, setOpen] = useState(false);
  const count = selectedMuscles.length + selectedEquipment.length;

  return (
    <>
      <Button
        className="flex-1"
        icon={<FunnelIcon weight={count > 0 ? "fill" : "bold"} />}
        onClick={() => setOpen(true)}
      >
        {count > 0 ? `Filters (${count})` : "Filter exercises"}
      </Button>

      <Sheet
        open={open}
        onOpenChange={setOpen}
        title="Filter exercises"
        footer={
          <>
            <Button
              className="flex-1"
              disabled={count === 0}
              onClick={() => {
                onMusclesChange([]);
                onEquipmentChange([]);
              }}
            >
              Clear filters
            </Button>
            <Button className="flex-1" variant="primary" onClick={() => setOpen(false)}>
              Show exercises
            </Button>
          </>
        }
      >
        <FilterGroup title="Muscles">
          {muscleOptions.map((muscle) => (
            <Checkbox
              key={muscle.value}
              label={muscle.label}
              checked={selectedMuscles.includes(muscle.value)}
              onCheckedChange={(checked) =>
                onMusclesChange(toggle(selectedMuscles, muscle.value, checked))
              }
            />
          ))}
        </FilterGroup>
        <FilterGroup title="Equipment">
          {equipmentOptions.map((equipment) => (
            <Checkbox
              key={equipment.value}
              label={equipment.label}
              checked={selectedEquipment.includes(equipment.value)}
              onCheckedChange={(checked) =>
                onEquipmentChange(toggle(selectedEquipment, equipment.value, checked))
              }
            />
          ))}
        </FilterGroup>
      </Sheet>
    </>
  );
}

function FilterGroup({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <fieldset className="flex flex-col gap-3">
      <legend className="text-accent mb-3 font-semibold">{title}</legend>
      <div className="grid grid-cols-2 gap-x-4 gap-y-3">{children}</div>
    </fieldset>
  );
}
