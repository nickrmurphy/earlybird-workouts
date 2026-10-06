import tailwindcss from "@tailwindcss/vite";
import { tanstackRouter } from "@tanstack/router-plugin/vite";
import react from "@vitejs/plugin-react";
import { fileURLToPath } from "node:url";
import { defineConfig } from "vite";
import { VitePWA } from "vite-plugin-pwa";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    tanstackRouter({ target: "react", autoCodeSplitting: true }),
    react(),
    tailwindcss(),
    VitePWA({
      // A new version waits until the user accepts the in-app prompt (src/pwa.ts)
      registerType: "prompt",
      injectRegister: false,
      manifest: {
        id: "/",
        name: "Workouts by Earlybird",
        short_name: "Workouts",
        description: "Plan workouts and track every set, offline.",
        start_url: "/",
        scope: "/",
        display: "standalone",
        orientation: "portrait",
        categories: ["fitness", "health"],
        background_color: "#1d1d1b",
        theme_color: "#1d1d1b",
        icons: [
          { src: "pwa-192.png", sizes: "192x192", type: "image/png" },
          { src: "pwa-512.png", sizes: "512x512", type: "image/png" },
          { src: "pwa-512.png", sizes: "512x512", type: "image/png", purpose: "maskable" },
        ],
      },
      workbox: {
        // Precache the app shell and the static exercise data so the app works offline
        globPatterns: ["**/*.{js,css,html,json,png,woff2}"],
        // exercises.json is ~0.9 MB
        maximumFileSizeToCacheInBytes: 3 * 1024 * 1024,
        navigateFallback: "/index.html",
      },
    }),
  ],

  resolve: {
    alias: {
      $lib: fileURLToPath(new URL("./src/lib", import.meta.url)),
    },
  },

  // Static exercise data, icons and favicon are served from /static
  publicDir: "static",

  build: {
    outDir: "build",
  },

  server: {
    port: 1420,
    strictPort: true,
  },
});
