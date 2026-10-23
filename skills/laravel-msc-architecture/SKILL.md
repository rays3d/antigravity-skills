---
name: laravel-msc-architecture
description: "Enforce Model-Service-Controller-Request-Resource-Policy (MSC) architecture and clean separation of concerns in Laravel 13."
---

# Laravel MSC Architecture

## Layer Responsibilities

| Layer | Responsibility |
|--------|----------------|
| Request | Validation and authorization |
| Policy | Authorization rules |
| Controller | Coordinate requests, services, and responses |
| Service | Business logic and transactions |
| Model | Persistence, relationships, scopes, casts |
| Resource | API response transformation |

## Rules

- Controllers must remain thin.
- Business logic belongs in Services.
- Services must not depend on HTTP types (`Request`, `Response`, etc.).
- Models contain persistence concerns only.
- Resources format API responses.
- Controllers return API responses using the project's `ResponseHelper`.
- API responses should use Resources instead of exposing models directly.
- Format dates in Resources using the project `DateHelper`.
- Use the project's pagination helper where applicable.

## Delegation

When generating code, delegate to:

- `laravel-controller-generator`
- `laravel-form-request-generator`
- `laravel-api-resource-generator`
- `laravel-model-generator`
- `laravel-best-practices` (for general coding patterns and performance)

## Trigger

> Review architecture
> Scaffold feature
> Review Laravel code
