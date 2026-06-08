# Flutter Snake

A classic Snake game built with Flutter and [Flame](https://flame-engine.org/), featuring tilt controls via the device accelerometer, multiple visual themes, and high score tracking.

## Purpose of this project

This project is a demo built for an interview. Rather than focusing on the game itself, it is meant to illustrate three things:

- **Theming & customization** — a `ThemeExtension`-based system that lets the entire game palette swap at runtime, with three distinct themes as proof of concept.
- **Native interaction** — device sensors (accelerometer) are bridged through a type-safe platform channel via `pigeon`, then surfaced as a Riverpod stream to drive game input.
- **Architecture** — clean separation between pure domain logic (`SnakeSimulation`), application state (Riverpod providers), and presentation (Flame components), following a feature-first module structure.

Some parts of the implementation — notably the Flame rendering layer and game loop wiring — were written with AI assistance due to time constraints. Those areas are not the focus of the demo and are intentionally left as-is.

## Features

- **Flame game engine** — smooth game loop with fixed-rate snake movement
- **Tilt controls** — steer the snake by tilting the device (accelerometer-based, with configurable dead zone)
- **3 themes** — Neon, Retro, and Corporate, switchable at runtime
- **High score persistence** — best score saved locally via `shared_preferences`
- **Pure simulation core** — `SnakeSimulation` is fully decoupled from rendering and covered by unit tests

## Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) `3.44.1` (managed via [FVM](https://fvm.app/))
- [FVM](https://fvm.app/) for Flutter version management

```bash
dart pub global activate fvm
fvm install
```

## Getting started

```bash
git clone <repo-url>
cd fnake
fvm use
fvm flutter pub get
```

### Run code generation

The project uses `riverpod_generator` and `pigeon`. After cloning or pulling new changes run:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the app

```bash
fvm flutter run
```

### Run tests

```bash
fvm flutter test
```

## Project structure

```
lib/
├── app/
│   ├── theme/          # AppTheme definitions (neon, retro, corporate)
│   └── widgets/        # Shared widgets (AsyncValueWidget, ScorePill, …)
└── modules/
    ├── game/
    │   ├── domain/     # Pure models: SnakeSimulation, GameConfig, Direction, Cell
    │   ├── application/ # Riverpod providers: game session, input mapping
    │   └── presentation/ # Flame components: board, snake, food, HUD
    ├── high_score/     # High score service + repository (shared_preferences)
    ├── sensors/        # Accelerometer & gyroscope abstraction (pigeon + riverpod)
    └── settings/       # Theme picker sheet
```

## Tech stack

| Package | Purpose |
|---|---|
| `flame` + `flame_riverpod` | Game loop & rendering |
| `flutter_riverpod` + `riverpod_annotation` | State management |
| `pigeon` | Type-safe platform channel for sensors |
| `shared_preferences` | High score persistence |
| `build_runner` + `riverpod_generator` | Code generation |
