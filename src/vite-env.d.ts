/// <reference types="vite/client" />
/// <reference types="vite-plugin-pwa/client" />

interface ImportMetaEnv {
  readonly PUBLIC_DEXIE_CLOUD_DATABASE_URL: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
