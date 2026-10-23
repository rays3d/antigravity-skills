---
name: flutter-theme-manager
description: "Enforce centralized Material 3 theming using ThemeData, ThemeExtensions, ColorScheme, and TextTheme."
---

# Theme Manager

## Rules

1. Reuse existing theme resources before creating new ones.
2. Never hardcode colors or text styles in widgets.
3. Prefer:
   - `Theme.of(context).colorScheme`
   - `Theme.of(context).textTheme`
   - Project ThemeExtensions for semantic colors and styles.
4. Add new semantic colors or styles to the project's ThemeExtensions instead of widget-local constants.
5. Keep light and dark themes synchronized.
6. Prefer themed widget styling over widget-local overrides.

## Prompt

> Apply the project's Material 3 theme conventions using ThemeExtensions, ColorScheme, and TextTheme.
