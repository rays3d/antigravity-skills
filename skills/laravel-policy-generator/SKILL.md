---
name: laravel-policy-generator
description: "Scaffold Laravel 13 authorization policies enforcing ownership and role-based permissions."
---

# Laravel Policy Generator

## Rules

- Generate policies in `app/Policies`.
- Generate standard policy methods (`viewAny`, `view`, `create`, `update`, `delete`, `restore`, `forceDelete`) as applicable.
- Follow the project's authorization strategy:
  - Ownership (`user_id`)
  - Role-based access
  - Workspace/Team membership
- Keep authorization logic inside Policies; avoid permission checks in Controllers or Services.
- Extract repeated authorization logic into private helper methods when appropriate.
- Use strict boolean return types.

## Notes

- Do not assume every model uses `user_id`; inspect the model and relationships first.
- Reuse shared authorization helpers instead of duplicating logic.
- Recommend registering the policy if automatic discovery is not used.

## Trigger

> "Create a policy for ..."
> "/policy <Model>"

## Reference Templates

### Standard Ownership Policy Template

```php
<?php

namespace App\Policies;

use App\Models\User;
use App\Models\{{ModelName}};

class {{ModelName}}Policy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        return $user->id === ${{modelNameCamel}}->user_id;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return true;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        return $user->id === ${{modelNameCamel}}->user_id;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        return $user->id === ${{modelNameCamel}}->user_id;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        return $user->id === ${{modelNameCamel}}->user_id;
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        return $user->id === ${{modelNameCamel}}->user_id;
    }
}
```

### Workspace/Role Helper

When scaffolded with Workspace/Team rules, inject this helper at the bottom of the class and use it for mutation methods instead of the simple `$user->id` check:

```php
    private function isOwnerOrAdmin(User $user, {{ModelName}} ${{modelNameCamel}}): bool
    {
        if (${{modelNameCamel}}->user_id === $user->id) {
            return true;
        }

        return ${{modelNameCamel}}->members()
            ->where('user_id', $user->id)
            ->whereIn('role', ['admin', 'owner'])
            ->exists();
    }
```
