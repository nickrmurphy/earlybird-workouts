import type { Activity } from "../state/Activity.svelte";

type GlobalStore = {
  Activity: Activity;
};

const GlobalStore = $state<GlobalStore>({
  Activity: undefined!, // initialized in init
});

export { GlobalStore };
