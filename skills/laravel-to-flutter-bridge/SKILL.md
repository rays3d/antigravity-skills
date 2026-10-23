---
name: laravel-to-flutter-bridge
description: "Generate Flutter Dart models, enums, and Riverpod providers directly from Laravel API Resources and contracts."
---

# Laravel to Flutter Bridge

## Purpose

Creates Flutter data models that match Laravel API output.

## Rules

- Use Laravel API Resources as the source of truth.
- Do not use `$fillable` unless no Resource exists.
- Map Laravel fields to Dart types:
  - `bigInteger/id` → `int`
  - `decimal` → `double`
  - `boolean` → `bool`
  - `datetime` → `DateTime`
  - `array/json` → `Map<String, dynamic>` or typed models
  - relationships → nested models or lists

## Enum Mapping

When a Laravel backed Enum is detected:

- Generate a matching Dart enum.
- Map values using the Laravel enum string values.
- Add JSON serialization support.

## Model Generation

Generate models in:

```
lib/features/<feature>/data/models/
```

Requirements:

- Use `json_serializable`.
- Use `FieldRename.snake` when compatible with the project.
- Include:
  - `fromJson`
  - `toJson`
  - generated part file.

## Nullability

- Match API guarantees.
- Use nullable fields when the API can omit or return null.
- Do not blindly make every field nullable.

## Delegation

For state management generation, use:

- `flutter-provider-scaffold`
- `flutter-riverpod-controller-generator`

## Trigger

> "Generate Flutter model from Laravel Resource"
> "Sync Laravel Resource with Flutter model"
