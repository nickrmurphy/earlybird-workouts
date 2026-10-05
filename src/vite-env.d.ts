/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly PUBLIC_DEXIE_CLOUD_DATABASE_URL: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
