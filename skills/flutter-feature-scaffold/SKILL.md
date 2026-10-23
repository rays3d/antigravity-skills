---
name: flutter-feature-scaffold
description: "Scaffold new Flutter features using Feature-First Clean Architecture (data, domain, presentation layers)."
---

# Feature Scaffold

## Rules

1. Extract the feature name and convert it to `snake_case`.
2. Create the standard feature structure:
   - `data/`
   - `domain/`
   - `presentation/`
3. Generate the core boilerplate:
   - Domain entity
   - Repository interface
   - Repository implementation
   - Data source
   - Provider/state management
   - Initial page
   - Common widgets
4. Follow project conventions for:
   - State management
   - Routing
   - Dependency injection
   - Code generation
5. Generate or update the feature's `imports.dart` barrel file if the project uses one.
6. **Consult `flutter-project-conventions`** for specific architectural layers and rules.

## Prompt

> Scaffold the `<feature>` feature using the project's architecture and conventions.
