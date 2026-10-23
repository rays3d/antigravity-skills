---
name: laravel-response-standardizer
description: "Enforce standardized JSON API responses across Laravel applications using ResponseHelper and PaginationHelper."
---

# Laravel Response Standardizer

## Rules

- Do not use `response()->json()` directly in controllers.
- Return API responses using the project's `ResponseHelper`.
- Return API Resources instead of Eloquent models.
- Use the project's `PaginationHelper` for paginated endpoints.
- Keep response formatting in Controllers and Resources, not Services.

## Standard Mapping

| Action | Response |
|--------|----------|
| Index | `ResponseHelper::paginated()` |
| Show | `ResponseHelper::success()` |
| Store | `ResponseHelper::created()` |
| Update | `ResponseHelper::success()` |
| Delete | `ResponseHelper::deleted()` |
| Errors | `ResponseHelper::error()` |

## Trigger

> Review API responses
> Refactor controller responses
> Standardize API responses
