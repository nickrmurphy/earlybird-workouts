import { TabNav } from "$lib/components";
import { createFileRoute, Outlet } from "@tanstack/react-router";

export const Route = createFileRoute("/_tabs")({
  component: TabsLayout,
});

function TabsLayout() {
  return (
    <>
      <Outlet />
      <TabNav />
    </>
  );
}
