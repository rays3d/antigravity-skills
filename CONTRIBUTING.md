# Contributing to Google Antigravity Skills

Thank you for contributing to the Google Antigravity Skills repository! This guide outlines the conventions and workflow for adding, updating, and testing skills.

---

## Skill Architecture

Every skill must reside in its own folder under `skills/<skill-name>/`:

```text
skills/<skill-name>/
├── SKILL.md          # Required: Main instruction file with YAML frontmatter
├── rules/            # Optional: Granular Markdown rule documents
├── scripts/          # Optional: Executable automation or validator scripts
├── examples/         # Optional: Reference code implementations
├── resources/        # Optional: Config files, templates, or assets
└── references/       # Optional: Manuals, checklists, or API specs
```

### 1. `SKILL.md` Formatting

Each skill must start with valid YAML frontmatter containing `name` and `description`:

```markdown
---
name: your-skill-name
description: A concise third-person summary of what this skill does and when the agent should use it.
---

# Your Skill Title

## Rules / Instructions
1. Step-by-step guidance...
```

* **Naming**: Use lowercase `kebab-case`. Prefix stack-specific skills appropriately (`flutter-*`, `laravel-*`, `react-*`).
* **Description**: Write clear, descriptive triggers for progressive disclosure.

---

## Technology Stack Conventions

### Flutter (Stable)
* **State Management**: Riverpod 3.0 Notifiers / AsyncNotifiers with `@riverpod` annotations and Freezed models.
* **Navigation**: GoRouter with named routing and centralized route definitions.
* **Architecture**: Feature-First Clean Architecture (`data/`, `domain/`, `presentation/`).
* **Linting & Code Style**: Very Good Analysis rules (`dart format` with 100-character line length).

### Laravel 13 & PHP 8.5
* **Architecture**: Model-Service-Controller (MSC) with skinny controllers, dedicated service classes, and result-array patterns.
* **PHP 8.5**: Typed class constants and constructor property promotion.
* **Models**: Enforce `protected function casts(): array` method over `$casts` property.
* **Migrations**: Every column modification via `->change()` must explicitly re-declare all existing column attributes.
* **Testing**: Pest PHP v4 with architecture tests and strict data isolation.

### React 19
* **Components**: Modern functional components with TypeScript (`.tsx`).
* **Ref Handling**: Pass `ref` directly as a prop (never use `forwardRef`).
* **Hooks**: React 19 Actions, `useActionState`, `useOptimistic`, and the `use` hook.
* **Styling**: Tailwind CSS v4 or CSS modules.

---

## Registering Skills in `skills.json`

When creating or modifying a skill, update [`skills.json`](skills.json):

```json
{
  "stacks": {
    "flutter": {
      "skills": [
        "flutter-your-new-skill"
      ]
    }
  }
}
```

---

## Verification & Testing

Before submitting changes, verify catalog integrity:

```bash
# 1. Test catalog discovery
python install.py --list

# 2. Test dry-run installation
python install.py --dry-run --all

# 3. Test PowerShell installer
pwsh ./install.ps1 -DryRun -All
```
