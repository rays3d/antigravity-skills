---
name: flutter-barrel-enforcer
description: "Generate or update feature-level imports.dart barrel files by exporting internal Dart files and excluding generated libraries."
---

# Barrel Enforcer

## Rules

1. Scan the feature directory recursively for `.dart` files.
2. Exclude:
   - `imports.dart`
   - `*.g.dart`
   - `*.freezed.dart`
   - `*.gr.dart`
   - `*.config.dart`
   - test files
3. Export only project files within the feature.
4. Never export package imports (`package:`) or Dart SDK libraries (`dart:`).
5. Use relative `export` statements.
6. Keep exports deterministic by sorting them alphabetically.
7. Exclude platform-specific features & stubs (e.g., `*.android.dart`, `*.stub.dart`, `*.web.dart`).

## Prompt

> Generate or update the `imports.dart` file for `lib/features/home` using the project conventions.
