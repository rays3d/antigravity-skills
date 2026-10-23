---
name: laravel-date-standardizer
description: "Enforce consistent date serialization and timezone normalization in Laravel API responses using DateHelper."
---

# Laravel Date Standardizer

## Rules

1. Format dates using `DateHelper`; never use inline Carbon formatting in API responses.
2. Apply date formatting only in the presentation layer (API Resources).
3. Keep Models and Services free of presentation-specific date formatting.
4. Ensure all serialized date fields use the project's standard format.
5. Preserve `Carbon` instances internally until serialization.

## Detect

- `$date->format(...)`
- `$date->toDateString()`
- `$date->toDateTimeString()`
- `Carbon::parse(...)->format(...)`

## Prompt

> Replace inline Carbon date formatting with `DateHelper` while preserving the project's serialization conventions.
