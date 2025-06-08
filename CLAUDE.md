# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Core development
pnpm dev              # Start development server (Vite on port 1420)
pnpm build            # Build for production
pnpm preview          # Preview production build

# iOS development
pnpm dev:ios          # iOS development with iPhone 16 Pro simulator
pnpm build:ios        # Build iOS app
pnpm build:appstore   # Build for App Store submission
pnpm publish:appstore # Publish to App Store (requires API keys)

# Code quality
pnpm lint             # Run ESLint + Prettier check
pnpm format           # Format code with Prettier
pnpm check            # SvelteKit sync + type checking
pnpm check:watch      # Type checking in watch mode

# Tauri commands
pnpm tauri            # Access Tauri CLI commands
```

## Architecture Overview

**Earlybird Workouts** is a cross-platform fitness tracking app built with Tauri + SvelteKit + TypeScript.

### Tech Stack
- **Frontend**: SvelteKit with Svelte 5 runes (`$state`, `$effect`)
- **Backend**: Tauri (Rust) for native desktop/mobile functionality  
- **Database**: Dexie (IndexedDB) with Dexie Cloud synchronization
- **Styling**: Tailwind CSS v4
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
- Reactive queries using `liveQuery`

### Component Architecture

```
src/lib/components/
├── features/          # Business logic components
│   ├── activity/      # Active workout tracking
│   ├── history/       # Workout history views
│   ├── settings/      # App configuration
│   └── workout/       # Workout management
├── page/              # Layout and navigation
├── shared/            # Reusable business components
└── ui/                # Pure UI components (Button, Dialog, etc.)
```

### State Management

- **Global state**: `src/lib/state/globalState.svelte.ts` using Svelte 5 `$state`
- **Activity tracking**: Active workout state in `Activity.svelte.ts`
- **Database queries**: Reactive via Dexie's `liveQuery`
- **Settings**: Persisted in localStorage via `src/lib/utils/settings.ts`

### Routing Structure

SvelteKit file-based routing with nested layouts:

- `/` - Home (workout list)
- `/[workoutId]/` - Workout details with nested routes:
  - `exercises/` - Exercise selection
  - `history/` - Workout history
  - `reorder/` - Exercise reordering
- `/active/[historyId]/` - Active workout tracking
- `/history/` - Global workout history

## Exercise Data

Static JSON files in `/static/` contain 15,785+ exercises with metadata:
- `exercises.json` - Complete exercise database
- `categories.json`, `muscles.json`, etc. - Classification data

Exercises are referenced by ID in workout data but not stored in Dexie.

## Tauri Configuration

- **Desktop + iOS** builds configured in `tauri.conf.json`
- **Static site generation** via `@sveltejs/adapter-static` for Tauri compatibility
- **Native plugins**: dialog, haptics
- **iOS signing** and App Store deployment ready

## Key Development Notes

- Uses **Svelte 5 runes** (`$state`, `$effect`) - avoid old reactive syntax
- **Type-first approach** - always define Zod schema before TypeScript types
- **Offline-first** - app works without internet, syncs when available
- **Mobile-optimized** - fullscreen app with haptic feedback
- All database mutations go through `src/lib/db/mutations/`
- Queries use `src/lib/db/queries/` with reactive `liveQuery`
- **pnpm** is the package manager (not npm/yarn)