---
name: laravel-middleware-generator
description: "Scaffold custom Laravel 13 middleware classes configured via bootstrap/app.php."
---

# Laravel Middleware Generator

## Rules

- Generate middleware in `app/Http/Middleware`.
- Class names should end with `Middleware`.
- Use typed method signatures.
- For API middleware, return `ResponseHelper` responses instead of `abort()`.
- For web middleware, redirects are acceptable.
- Add a concise class PHPDoc.
- Keep middleware focused on request filtering; move business logic to Services or Policies.

## After Generation

- Register the middleware alias in the application's middleware configuration.
- Apply it to the appropriate routes.
- Recommend adding a feature test for authorized and unauthorized requests.

## Trigger

> "Create middleware for ..."
> "Scaffold middleware ..."
