---
name: laravel-service-generator
description: "Generate Laravel 13 service classes enforcing business logic isolation, result-array responses, and PHP 8.5 standards."
---

# Laravel Service Generator

## Purpose

Creates service classes in `app/Services/` following the project's MSC architecture.

Services are the **business logic layer** between Controllers and Models.

Controllers:
- Validate requests.
- Authorize actions.
- Call Services.
- Return Resources via ResponseHelper.

Services:
- Execute business rules.
- Manage transactions.
- Access Models/Repositories/APIs.
- Return data or operation results.

---

# Rules Engine

## 1. Service Location

All services must be created in:
