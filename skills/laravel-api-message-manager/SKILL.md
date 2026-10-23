---
name: laravel-api-message-manager
description: "Enforce centralized API response and logging messages using App\\Constants\\ApiMessages with PHP 8.5 typed constants."
---

# API Message Manager

## Rules

1. Never use hardcoded response or log messages.
2. Reuse existing `ApiMessages` constants before creating new ones.
3. Add new message constants using the project's naming conventions.
4. Keep user-facing messages and internal log messages separate.
5. Group related constants by entity or feature and maintain consistent ordering.
6. Use typed class constants following the project's PHP 8.5+ conventions.

## Prompt

> Replace hardcoded messages with `ApiMessages` constants, adding new constants only when required.
