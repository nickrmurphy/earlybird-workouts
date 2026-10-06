# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Core development
pnpm dev              # Start development server (Vite on port 1420)
pnpm build            # Build for production
pnpm preview          # Preview production build (service worker active; use to test offline/install)

# Code quality
pnpm lint             # Run oxlint + oxfmt check
pnpm format           # Format code with oxfmt
pnpm check            # TypeScript type checking (tsc)
pnpm check:watch      # Type checking in watch mode
```

## Architecture Overview

**Earlybird Workouts** is an installable, offline-first fitness tracking PWA built with React + TypeScript.

### Tech Stack

- **Frontend**: React 19 + Vite, TanStack Router (file-based routes in `src/routes/`)
- **Design system**: EB (React components on Base UI), vendored in `src/lib/eb/`
- **PWA**: `vite-plugin-pwa` (configured in `vite.config.js`) generates the manifest and a Workbox service worker that precaches the app shell and `static/` data
- **Database**: Dexie (IndexedDB) with Dexie Cloud synchronization
- **Styling**: EB components style themselves; Tailwind CSS v4 for page layout only, with its theme mapped onto the `--eb-*` tokens (`src/main.css`)
- **Icons**: `@phosphor-icons/react`
- **Type Safety**: TypeScript + Zod schemas

### Database Architecture

Uses Dexie with the following core entities:

```typescript
workouts: { id, name }                                    // Workout templates
workoutExercises: { id, workoutId, exerciseId, ... }     // Exercises in workouts
history: { id, workoutId, startTime, endTime }           // Completed workouts
historyExercises: { id, historyId, exerciseId }          // Exercises in sessions
historySets: { id, historyId, historyExerciseId, ... }   // Individual sets performed
```

**Key patterns:**

- All entities use string UUIDs for primary keys
- Zod schemas define types and runtime validation (`src/lib/db/schema/`)
- Cloud sync via Dexie Cloud addon
- Reactive queries using `useLiveQuery` from `dexie-react-hooks`

### Component Architecture

```
src/lib/
├── eb/                # Vendored EB design system (do not edit; re-sync from the EB artifact)
├── components/
│   ├── features/      # Business logic components (activity, history, workout)
│   ├── page/          # Page, PageHeader, TabNav, bottom Toolbar, NotFound
│   └── shared/        # Reusable pieces (Sheet, InputDialog, ConfirmHost, …)
├── state/             # External stores + hooks (active workout, timers, confirm)
└── data/              # Cached loader for the static exercise JSON
```

**EB usage:**

- Use EB components (`Button`, `Dialog`, `Drawer`, `Menu`, `Select`, `Field`, `Input`, `SegmentedControl`, `ToggleButton`, `Card`, `Checkbox`, …) from `$lib/eb` instead of building UI primitives.
- At most one `primary` Button per view; destructive menu items use `tone="danger"`.
- Bottom drawers go through `Sheet` (`src/lib/components/shared/Sheet.tsx`), which adds safe-area padding.
- Confirmations use `confirm()` from `$lib/state` (an in-app EB Dialog). Don't use native `window.confirm`.
- `src/lib/eb/index.d.ts` carries a small local patch (ref types); keep it when re-syncing.

### State Management

- **Active workout**: `activity` singleton in `src/lib/state/Activity.ts` (history id, elapsed `Timer`, `RestTimer`), read in components with `useActiveId`, `useTimer`, `useRestTimer` (`useSyncExternalStore`)
- **Database queries**: Reactive via `useLiveQuery`
- **Settings**: Persisted in localStorage via `src/lib/utils/settings.ts`

### Routing Structure

TanStack Router file-based routing (`src/routes/`, generating `src/routeTree.gen.ts`):

- `/`, `/history`, `/settings` - Tab pages (Workouts, History, Settings) under the pathless `_tabs` layout with the bottom `TabNav`
- `/$workoutId/` - Workout details; `route.tsx` loads the exercise data for its children:
  - `exercises` - Edit the workout's exercises: reorder, remove, and an add sheet with the catalog (`?add=true` opens it)
  - `history/` and `history/$historyId` - Workout history and detail (`?from=` back link)
- `/active/$historyId/` and `/active/$historyId/$exerciseId` - Active workout tracking

The root route redirects to the active workout while one is in progress.

## Exercise Data

Static JSON files in `/static/` contain 15,785+ exercises with metadata:

- `exercises.json` - Complete exercise database
- `categories.json`, `muscles.json`, etc. - Classification data

Exercises are referenced by ID in workout data but not stored in Dexie.

## PWA

- **Static SPA build**: Vite outputs to `build/`, serving `static/` as the public dir; deployed to Cloudflare Pages
- **Service worker**: registered in `src/pwa.ts` with `registerType: "prompt"`; a new version asks to reload via `confirm()`. The dev server does not run the service worker, so test offline behaviour with `pnpm build && pnpm preview`
- **Icons**: `static/pwa-192.png`, `static/pwa-512.png` (also maskable) and `static/apple-touch-icon.png`, generated from `app-icon.png` with an opaque background
- **iOS install**: meta tags in `index.html` make the home-screen app full screen under the status bar; layout relies on the safe-area variables in `src/main.css`
- **Haptics**: `haptic()` in `src/lib/utils/haptics.ts` uses the Vibration API, with an iOS switch-toggle fallback

## Key Development Notes

- **React 19** function components and hooks; keep lint clean (`oxlint`)
- **Type-first approach** - always define Zod schema before TypeScript types
- **Offline-first** - app works without internet, syncs when available
- **Mobile-optimized** - installable, full-screen PWA with haptic feedback
- All database mutations go through `src/lib/db/mutations/`
- Queries use `src/lib/db/queries/` with reactive `liveQuery`
- **pnpm** is the package manager (not npm/yarn)
