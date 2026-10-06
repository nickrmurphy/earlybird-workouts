import { Page, PageHeader, WeightUnitSelect } from "$lib/components";
import { getDefaultWeightUnit, setDefaultWeightUnit } from "$lib/utils";
import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";

export const Route = createFileRoute("/_tabs/settings")({
  component: Settings,
});

function Settings() {
  const [defaultUnit, setDefaultUnit] = useState(getDefaultWeightUnit);

  return (
    <Page>
      <PageHeader title="Settings" />
      <WeightUnitSelect
        label="Default weight unit"
        value={defaultUnit}
        onValueChange={(unit) => {
          setDefaultWeightUnit(unit);
          setDefaultUnit(unit);
        }}
      />
    </Page>
  );
}
