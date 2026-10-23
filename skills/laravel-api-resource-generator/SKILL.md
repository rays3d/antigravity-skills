---
name: laravel-api-resource-generator
description: "Generate Laravel API Resources following strict serialization, typed return arrays, and DateHelper formatting."
---

# Laravel API Resource Generator

## Rules

1. Generate Resources in `app/Http/Resources`.
2. Declare `public function toArray(Request $request): array`.
3. Document the return type with `@return array<string, mixed>`.
4. Format all dates using `DateHelper`; never format Carbon instances inline.
5. Serialize relationships using `whenLoaded()` and nested Resource classes.
6. Exclude internal or sensitive attributes unless explicitly required.
7. Keep Resources presentation-only; avoid business logic and database queries.

## Output

Generate:
- Resource class
- Resource Collection (if applicable)
- Required imports
- Relationship mappings
- Date formatting
- PHPDoc

## Prompt

> Generate an API Resource for this model using the project's serialization conventions.
