---
name: flutter-router-generator
description: "Manage GoRouter configurations, register routes, enforce named navigation, and configure route transitions."
---

# Router Generator

## Rules

1. Register every route in the project's GoRouter configuration.
2. Keep route names, paths, and route definitions synchronized.
3. Use centralized route constants instead of hardcoded strings.
4. Use named navigation (`goNamed`, `pushNamed`) instead of raw path navigation.
5. Root routes must begin with `/`; nested routes must use relative paths.
6. Preserve existing route hierarchy, transitions, guards, and redirects.

## Prompt

> Add or update a GoRouter route following the project's routing conventions and synchronize all related routing files.
