import Database from "@tauri-apps/plugin-sql";

type DBStore = {
  earlybird: Database;
};

export const db = $state<DBStore>({
  earlybird: undefined!, // Set on app initialization in hooks.client.ts
});
