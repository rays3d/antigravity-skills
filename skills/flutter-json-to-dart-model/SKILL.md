---
name: flutter-json-to-dart-model
description: "Generate Freezed and json_serializable Dart models from JSON schemas following project serialization conventions."
---

# JSON to Dart Model

## Rules

1. Infer the model name from the JSON or surrounding context.
2. Map JSON values to appropriate Dart types, including nested objects, lists, enums, and nullable fields.
3. Generate models using the project's serialization approach (Freezed with `json_serializable`, or `JsonSerializable` where applicable).
4. Add the required annotations, `part` directives, and `fromJson`/`toJson` methods.
5. Apply `@JsonKey` where JSON keys differ from Dart naming conventions.
6. Recommend the appropriate `build_runner` command if code generation is required.

## Prompt

> Generate Dart model(s) from this JSON using the project's serialization conventions.
