---
name: laravel-controller-generator
description: "Generate skinny Laravel 13 controllers enforcing Model-Service-Controller (MSC) constraints with no direct DB access."
---

# Laravel Controller Generator

## Rules

1. Keep controllers orchestration-only.
2. Delegate business logic to Services.
3. Use Form Requests for validation.
4. Use Route Model Binding where appropriate.
5. Return responses through `ResponseHelper`.
6. Serialize models using API Resources.
7. Never perform database queries, business logic, or calculations in controllers.
8. Never use inline validation or raw `response()->json()`.

## Conventions

- Constructor dependency injection using PHP property promotion.
- Authorization via Policies or Form Requests.
- Pagination through project pagination helpers.
- Use centralized `ApiMessages` for response messages.
- Keep controllers focused on request → service → response flow.

## Output

Generate:
- Controller
- Required imports
- Service injection
- CRUD methods (if requested)
- Form Request integration
- API Resource responses

## Prompt

> Generate a Laravel controller following the project's MSC + RPR architecture.
