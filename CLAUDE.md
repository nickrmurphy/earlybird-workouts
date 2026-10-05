# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Core development
pnpm dev              # Start development server (Vite on port 1420)
pnpm build            # Build for production
pnpm preview          # Preview production build

# iOS development
pnpm dev:ios          # iOS development with iPhone 17 Pro simulator
pnpm build:ios        # Build iOS app
pnpm build:appstore   # Build for App Store submission
pnpm publish:appstore # Publish to App Store (requires API keys)

# Code quality
pnpm lint             # Run oxlint + oxfmt check
pnpm format           # Format code with oxfmt
pnpm check            # TypeScript type checking (tsc)
pnpm check:watch      # Type checking in watch mode

# Tauri commands
pnpm tauri            # Access Tauri CLI commands
```

## Architecture Overview

**Earlybird Workouts** is a cross-platform fitness tracking app built with Tauri + React + TypeScript.

### Tech Stack

- **Frontend**: React 19 + Vite, TanStack Router (file-based routes in `src/routes/`)
- **Design system**: EB (React components on Base UI), vendored in `src/lib/eb/`
- **Backend**: Tauri (Rust) for native desktop/mobile functionality
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
│   ├── features/      # Business logic components (activity, history, settings, workout)
│   ├── page/          # Page, PageHeader, bottom Navbar, NotFound
│   └── shared/        # Reusable pieces (Sheet, InputDialog, ConfirmHost, …)
├── state/             # External stores + hooks (active workout, timers, confirm)
└── data/              # Cached loader for the static exercise JSON
```

**EB usage:**

- Use EB components (`Button`, `Dialog`, `Drawer`, `Menu`, `Select`, `Field`, `Input`, `SegmentedControl`, `ToggleButton`, `Card`, `Checkbox`, …) from `$lib/eb` instead of building UI primitives.
- At most one `primary` Button per view; destructive menu items use `tone="danger"`.
- Bottom drawers go through `Sheet` (`src/lib/components/shared/Sheet.tsx`), which adds safe-area padding.
- Confirmations use `confirm()` from `$lib/state` (an in-app EB Dialog). Native `window.confirm` does not work in Tauri's iOS webview.
- `src/lib/eb/index.d.ts` carries a small local patch (ref types); keep it when re-syncing.

### State Management

- **Active workout**: `activity` singleton in `src/lib/state/Activity.ts` (history id, elapsed `Timer`, `RestTimer`), read in components with `useActiveId`, `useTimer`, `useRestTimer` (`useSyncExternalStore`)
- **Database queries**: Reactive via `useLiveQuery`
- **Settings**: Persisted in localStorage via `src/lib/utils/settings.ts`

### Routing Structure

TanStack Router file-based routing (`src/routes/`, generating `src/routeTree.gen.ts`):

- `/` - Home (workout list)
- `/$workoutId/` - Workout details; `route.tsx` loads the exercise data for its children:
  - `exercises` - Exercise selection (`?complete=true` after creating a workout)
  - `history/` and `history/$historyId` - Workout history and detail (`?from=` back link)
  - `reorder` - Exercise reordering
- `/active/$historyId/` and `/active/$historyId/$exerciseId` - Active workout tracking
- `/history` - Global workout history

The root route redirects to the active workout while one is in progress.

## Exercise Data

Static JSON files in `/static/` contain 15,785+ exercises with metadata:

- `exercises.json` - Complete exercise database
- `categories.json`, `muscles.json`, etc. - Classification data

Exercises are referenced by ID in workout data but not stored in Dexie.

## Tauri Configuration

- **Desktop + iOS** builds configured in `tauri.conf.json`
- **Static SPA build**: Vite outputs to `build/` (`frontendDist`), serving `static/` as the public dir
- **Native plugins**: haptics
- **iOS signing** and App Store deployment ready

## Key Development Notes

- **React 19** function components and hooks; keep lint clean (`oxlint`)
- **Type-first approach** - always define Zod schema before TypeScript types
- **Offline-first** - app works without internet, syncs when available
- **Mobile-optimized** - fullscreen app with haptic feedback
- All database mutations go through `src/lib/db/mutations/`
- Queries use `src/lib/db/queries/` with reactive `liveQuery`
- **pnpm** is the package manager (not npm/yarn)
