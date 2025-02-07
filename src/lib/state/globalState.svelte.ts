import type { Activity } from "./Activity.svelte";

type GlobalState = {
  activity: Activity;
};

const globalState = $state<GlobalState>({
  activity: undefined!, // initialized in init
});

export { globalState };
