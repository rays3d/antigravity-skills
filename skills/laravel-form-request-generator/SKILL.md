---
name: laravel-form-request-generator
description: "Generate Laravel 13 Form Requests adhering to authorization, validation rules, and custom error messaging conventions."
---

# Laravel Form Request Generator

## Rules

1. Generate requests under `App\Http\Requests\<Domain>`.
2. Keep controllers free of inline validation.
3. Prefer string-based validation rules unless `Rule` objects are required.
4. Use `Rule::exists()` or `Rule::unique()` when scoped validation is needed.
5. Apply ownership or tenant constraints where required.
6. Keep authorization in `authorize()` only when request-level authorization is appropriate; otherwise defer to Policies.

## Conventions

- Use pipe-separated rules for simple validation.
- Use `Rule` objects for conditional, scoped, or database validation.
- Group nested array validation consistently.
- Avoid business logic inside Form Requests.

## Output

Generate:
- Form Request class
- Required imports
- `authorize()`
- `rules()`
- Scoped validation (if applicable)

## Prompt

> Generate a Form Request following the project's validation and ownership conventions.
