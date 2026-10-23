---
name: flutter-asset-registrar
description: "Register Flutter assets and fonts in pubspec.yaml and maintain typed asset constants."
---

# Flutter Asset Registrar

## Rules

1. Scan asset directories (`assets/images`, `assets/icons`, `assets/fonts`, and other configured asset folders).
2. Compare discovered assets with `pubspec.yaml`.
3. Add missing asset or font entries without modifying existing configuration or comments.
4. Preserve valid YAML formatting and indentation.
5. Report malformed `pubspec.yaml` instead of attempting automatic fixes.
6. If the project maintains asset constants, update them according to the project's conventions.

## Prompt

> Synchronize `pubspec.yaml` with the current project assets and report any missing or invalid registrations.
