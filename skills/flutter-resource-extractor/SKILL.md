---
name: flutter-resource-extractor
description: "Enforce centralized project resources by extracting hardcoded strings, dimensions, and asset paths into constants."
---

# Resource Extractor

## Rules

1. Reuse existing centralized resources before creating new ones.
2. Never hardcode:
    - User-facing strings
    - Asset paths
    - Colors
    - Dimensions and spacing
    - Durations
    - Shared constants
3. If a required resource does not exist, add it to the appropriate centralized resource file following project naming conventions.
4. Use descriptive, consistent names and keep resource definitions organized.

## Resources

- Strings
- Dimensions
- Assets
- Shared constants

## Prompt

> Replace hardcoded resources with centralized project resources, creating new entries only when necessary.
