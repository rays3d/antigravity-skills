---
name: flutter-auditor
description: "Audit Flutter projects for Riverpod state management, GoRouter navigation, Clean Architecture, and performance compliance."
---

# Flutter Auditor

## Review Checklist

### Architecture
- Follow the project's feature structure and Clean Architecture.
- Respect state management, routing, dependency injection, and barrel file conventions.

### Project Conventions
- Prefer centralized resources (`AppStrings`, `AppColors`, `AppDimens`).
- Avoid hardcoded values when project constants exist.
- Prefer feature barrel imports over deep relative imports.

### Code Quality
- Identify unnecessary complexity, duplicated code, oversized widgets, and inappropriate lint suppressions.
- Recommend smaller, reusable components where appropriate.

### Performance
- Suggest `const` constructors where possible.
- Detect expensive work inside `build()`.
- Recommend lazy builders for large or dynamic collections.

## Output

For each issue provide:
- Severity
- Explanation
- Recommended fix
- Example improvement when helpful.
