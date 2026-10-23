---
name: laravel-enum-generator
description: "Generate PHP 8.5 backed string enums with label(), values(), and helper methods matching project conventions."
---

# Laravel Enum Generator

## Rules

1. Create enums in `app/Enums`.
2. Use PascalCase class names.
3. Use `UPPER_CASE` case names with lowercase snake_case backed values.
4. Implement `label()` and `values()` methods.
5. Generate `is*()` helpers only when they improve readability.
6. Add PHPDoc where required by project standards.
7. Remind the developer to register the enum in the model's casts.

## Conventions

- Keep labels centralized in `label()`.
- Use `self::cases()` instead of duplicating values.
- Avoid business logic inside enums.
- Prefer enums over string constants for finite value sets.

## Prompt

> Generate a backed enum using the project's conventions and include any recommended model casts.
