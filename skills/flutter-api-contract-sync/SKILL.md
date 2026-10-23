---
name: flutter-api-contract-sync
description: "Compare Laravel API Resources with Flutter models to detect missing fields, type mismatches, nullability issues, and serialization inconsistencies before runtime."
---

# API Contract Sync

## Logic

1. **Map:** Pair a Laravel `JsonResource` with the corresponding Flutter model (`fromJson`/`toJson`).
2. **Extract:** Compare JSON keys, field names, data types, and nullability.
3. **Validate:**
   - Missing or extra fields.
   - Type mismatches (`string` vs `int`, `bool`, `double`, etc.).
   - Nullable vs non-nullable inconsistencies.
   - Naming differences (`snake_case` ↔ `camelCase`).

## Prompt

> Compare `UserResource` with `UserModel`. Identify missing fields, type or nullability mismatches, naming inconsistencies, and serialization issues that could cause runtime errors.
