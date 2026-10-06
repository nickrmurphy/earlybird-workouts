import { TabBar } from "$lib/eb";
import { BarbellIcon, ClockCounterClockwiseIcon, GearIcon } from "@phosphor-icons/react";
import { useLocation, useNavigate } from "@tanstack/react-router";

const tabs = [
  { to: "/", label: "Workouts", icon: <BarbellIcon /> },
  { to: "/history", label: "History", icon: <ClockCounterClockwiseIcon /> },
  { to: "/settings", label: "Settings", icon: <GearIcon /> },
] as const;

/** Bottom tab bar for the top-level pages */
export function TabNav() {
  const navigate = useNavigate();
  const pathname = useLocation({ select: (location) => location.pathname });

  return (
    <div className="pointer-events-none fixed inset-x-0 bottom-0 z-10 flex justify-center px-4 pb-[var(--safe-bottom)]">
      {/* Stretched full width with equal tabs, like the iOS 26 floating tab bar */}
      <TabBar className="pointer-events-auto w-full [&>.eb-tabbar\_\_items]:flex-1">
        {tabs.map((tab) => (
          <TabBar.Item
            key={tab.to}
            className="h-auto flex-1 flex-col justify-center gap-0.5 px-2 py-1.5 text-xs [&>.eb-tabbar\_\_icon]:size-5"
            href={tab.to}
            icon={tab.icon}
            active={pathname === tab.to}
            onClick={(event) => {
              // Route in-app instead of reloading the page
              event.preventDefault();
              navigate({ to: tab.to });
            }}
          >
            {tab.label}
          </TabBar.Item>
        ))}
      </TabBar>
    </div>
  );
}
