import { Waves } from "$lib/assets";
import { ConfirmHost } from "$lib/components";
import { Button, Display } from "$lib/eb";
import { activity } from "$lib/state";
import { ArrowRightIcon, IconContext } from "@phosphor-icons/react";
import { createRootRoute, Outlet, redirect } from "@tanstack/react-router";
import { useState } from "react";

export const Route = createRootRoute({
  // An unfinished workout always reopens
  beforeLoad: ({ location }) => {
    const historyId = activity.currentId;
    if (historyId && !location.pathname.startsWith("/active")) {
      throw redirect({ to: "/active/$historyId", params: { historyId } });
    }
  },
  component: RootLayout,
});

function RootLayout() {
  const [welcomed, setWelcomed] = useState(() => localStorage.getItem("welcomed") === "true");

  return (
    <IconContext.Provider value={{ size: 24, weight: "bold" }}>
      {welcomed ? (
        <div className="animate-fade-in">
          <Outlet />
          <ConfirmHost />
        </div>
      ) : (
        <Welcome
          onStart={() => {
            localStorage.setItem("welcomed", "true");
            setWelcomed(true);
          }}
        />
      )}
    </IconContext.Provider>
  );
}

function Welcome({ onStart }: { onStart: () => void }) {
  return (
    <div className="animate-fade-in flex h-screen flex-col items-center justify-center">
      <div className="fixed inset-x-0 bottom-0 h-[42.8%] rotate-180 overflow-clip">
        <Waves />
      </div>
      <div className="z-10 mb-[70%] flex flex-col gap-3 px-6">
        <Display level={2} as="h1">
          Workouts
        </Display>
        <p className="text-accent text-xl font-semibold">by Early Bird</p>
      </div>
      <div className="fixed inset-x-10 z-10">
        <Button
          variant="primary"
          className="w-full"
          icon={<ArrowRightIcon />}
          iconPosition="end"
          onClick={onStart}
        >
          Get started
        </Button>
      </div>
    </div>
  );
}
