---
name: code-review
description: "Perform thorough code reviews checking correctness, edge cases, Riverpod, Laravel 13 MSC, PHP 8.5, and React 19 best practices."
---

# Code Review Skill

Reviews code changes for bugs, security vulnerabilities, performance regressions, and architectural adherence across **Flutter**, **Laravel 13**, and **React 19**.

## Review Checklist

1. **Correctness & Edge Cases**:
   - Does the logic handle nullability, empty states, and error scenarios?
   - Are async operations wrapped in error handlers or Result/AsyncValue structures?

2. **Flutter (Riverpod 3.0 & GoRouter)**:
   - Enforce Very Good Analysis rules and `dart format` (100 char limit).
   - Ensure business logic resides strictly in Riverpod Notifiers/AsyncNotifiers, never in UI widgets.
   - Forbid `StatelessWidget` when reading/watching state; use `ConsumerWidget` or `ConsumerStatefulWidget`.
   - Ensure GoRouter named routes are used instead of legacy `Navigator.push`.

3. **Laravel 13 & PHP 8.5**:
   - Verify Model-Service-Controller (MSC) compliance: skinny controllers, business logic in Services, explicit FormRequests.
   - Enforce PHP 8.5 typed class constants and constructor property promotion.
   - Enforce Laravel 13 `protected function casts(): array` method on Eloquent models.
   - Validate migration safety: every column modification with `->change()` re-declares all existing attributes.
   - Ensure tests use Pest PHP v4 architecture conventions.

4. **React 19**:
   - Verify functional components and modern React 19 hooks (`useActionState`, `useOptimistic`, `use`).
   - Ensure `ref` is passed directly as a prop (no obsolete `forwardRef`).
   - Validate CSS modules, Tailwind CSS v4 utility classes, and accessibility attributes.

5. **Security & Performance**:
   - No SQL injection, mass assignment, unvalidated user inputs, or exposed secrets.
   - Check for N+1 queries, unbounded API responses, and redundant widget re-renders.
