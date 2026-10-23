---
name: flutter-very-good-analysis
description: "Enforce Very Good Analysis lint rules, 100-character line limits, and standard dart formatting conventions."
---

# Flutter Very Good Analysis

## Rules

1. Verify `analysis_options.yaml` exists and includes `package:very_good_analysis/analysis_options.yaml` when the project uses Very Good Analysis.
2. Review code against the configured lint rules.
3. Prefer package imports over deep relative imports when required by project configuration.
4. Respect project-specific lint overrides instead of applying generic Dart recommendations.
5. Recommend formatting with `dart format` if generated or modified code may require it.

## Prompt

> Review this Flutter code for compliance with the project's Very Good Analysis configuration and identify any required fixes.
