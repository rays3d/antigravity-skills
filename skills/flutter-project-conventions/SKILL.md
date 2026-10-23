---
name: flutter-project-conventions
description: "Define and enforce architecture, Riverpod 3.0, GoRouter, theming, and coding conventions across Flutter projects."
---

# Flutter Project Conventions

## Stack

- GoRouter
- Riverpod (@riverpod)
- Freezed
- json_serializable
- Material 3
- ThemeExtensions
- Very Good Analysis

## Rules

1. Use feature-first architecture.
2. Use named GoRouter navigation.
3. Generate models with Freezed.
4. Generate providers using @riverpod.
5. Use ThemeExtensions and centralized resources.
6. Prefer package imports.
7. Follow Very Good Analysis.
8. Keep widgets focused and reusable.


## Recommended Package Standards (Latest Stable)
- **State Management**: `flutter_riverpod: ^3.4.3`, `riverpod_annotation: ^4.0.7`, `riverpod_generator: ^4.0.9` (dev).
- **Data Modeling**: `freezed_annotation: ^3.1.0`, `freezed: ^4.0.3` (dev), `json_annotation: ^4.12.0`, `json_serializable: ^6.15.2` (dev).
- **Navigation**: `go_router: ^18.1.1` (named navigation, type-safe routes).
- **Code Quality**: `very_good_analysis: ^11.0.0` (dev), 100-character line limit.
- **Code Generation**: Run with `dart run build_runner build --delete-conflicting-outputs`.
- **Pattern Matching**: Enforce native Dart 3 `switch` expressions; do NOT use deprecated `.when()` or `.map()` methods on Freezed classes.
