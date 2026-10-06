import { confirm } from "$lib/state";
import { registerSW } from "virtual:pwa-register";

// Registers the service worker (offline support) and asks before switching to a new version
const updateSW = registerSW({
  async onNeedRefresh() {
    const confirmed = await confirm("Reload to get the latest version of Workouts.", {
      title: "Update available",
      okLabel: "Reload",
    });
    if (confirmed) await updateSW(true);
  },
});
