---
name: laravel-model-generator
description: "Scaffold Eloquent models adhering strictly to Laravel 13 standards, casts() method, relationship types, and factories."
---

# Laravel Model Generator

## Rules

- Generate models in `app/Models`.
- Use the `casts(): array` method instead of the legacy `$casts` property.
- Add explicit return types to all relationship methods.
- Follow the project's mass-assignment strategy (`$fillable` or `$guarded`) consistently.
- Use enums, value objects, and custom casts where appropriate.
- Keep business logic in Services; models should primarily represent domain data and relationships.

## Companion Files

When generating a new model, also generate or remind about:

- Migration
- Factory
- Seeder

## Trigger

> "Create a model for ..."
> "Scaffold model ..."
