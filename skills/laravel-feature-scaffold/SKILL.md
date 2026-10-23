---
name: laravel-feature-scaffold
description: "Orchestrate scaffolding of complete Laravel 13 features following MSC architecture (Model, Migration, Service, Controller, Request, Resource, Policy)."
---

# Laravel Feature Scaffold

## Purpose
Automates the scaffolding of an entire feature for the Laravel API backend, ensuring that all necessary layers (Model, Migration, Controller, Request, Resource, Service, and Policy) are created consistently and correctly.

## Scaffolding Sequence
When asked to scaffold a feature, invoke the following skills in this exact sequence:

1. **`laravel-model-generator`**: Generates the Eloquent model, Migration, Factory, and Seeder.
2. **`laravel-service-generator`**: Generates the Service class containing the business logic.
3. **`laravel-policy-generator`**: Generates the Authorization Policy.
4. **`laravel-form-request-generator`**: Generates the Form Requests for validation.
5. **`laravel-api-resource-generator`**: Generates the API Resource for formatting the response.
6. **`laravel-controller-generator`**: Generates the Controller to tie everything together.

## Rules
- Prompt the user for the feature requirements before starting the generation.
- Ensure all generated files follow the `laravel-msc-architecture`.
- Remind the user to register any necessary routes in `api.php` after the controller is generated.

## Trigger
> "Scaffold a new feature for ..."
> "Create full CRUD for ..."
