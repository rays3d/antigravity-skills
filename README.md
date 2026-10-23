# Google Antigravity Agent Skills

A production-grade, consolidated suite of **56 AI Agent Skills** for the **Google Antigravity IDE and Agent CLI**, engineered specifically for modern full-stack development targeting:

* **Laravel 13** & **PHP 8.5**: Model-Service-Controller (MSC) Architecture, Pest PHP v4, typed class constants, and migration safety.
* **Flutter Stable**: Riverpod 3.0 Notifiers, Freezed state management, GoRouter named routing, and Very Good Analysis linting.
* **React 19**: Modern functional components, React 19 hooks (`useActionState`, `useOptimistic`, `use`), ref-as-prop, Inertia.js, and Tailwind CSS v4.
* **Universal Workflows**: Context-aware Conventional Commits, multi-stack code review, environment variable guards, and documentation managers.

All skills are consolidated into a single unified directory (`skills/`), completely deduplicated, stripped of project-specific references, and equipped with a multi-platform installer suite.

---

## Table of Contents

- [Quickstart Installation](#quickstart-installation)
  - [PowerShell 7 (Windows / macOS / Linux)](#powershell-7-windows--macos--linux)
  - [Bash / Shell (macOS / Linux / WSL)](#bash--shell-macos--linux--wsl)
  - [Python CLI (Universal Cross-Platform)](#python-cli-universal-cross-platform)
- [Installation Targets & Flags](#installation-targets--flags)
- [Skills Catalog](#skills-catalog)
  - [Flutter Skills (17 Skills)](#flutter-skills-17-skills)
  - [Laravel 13 & PHP 8.5 Skills (24 Skills)](#laravel-13--php-85-skills-24-skills)
  - [React 19 Skills (6 Skills)](#react-19-skills-6-skills)
  - [Universal & Workflow Skills (9 Skills)](#universal--workflow-skills-9-skills)
- [Antigravity Architecture & Integration](#antigravity-architecture--integration)
- [Repository Structure](#repository-structure)

---

## Quickstart Installation

You can install skills either **Globally to your Antigravity IDE** (`~/.gemini/config/skills/`) or **Locally to a specific project** (`<project>/.agent/skills/`).

### PowerShell 7 (Windows / macOS / Linux)

```powershell
# 1. List all available skills categorized by stack
.\install.ps1 -List

# 2. Install ALL skills globally to your Antigravity IDE
.\install.ps1 -Global

# 3. Install only Flutter skills to your current project
.\install.ps1 -Flutter -Project .

# 4. Install only Laravel 13 skills to a target project
.\install.ps1 -Laravel -Project D:\Projects\MyLaravelApp

# 5. Install only React 19 skills without common workflow skills
.\install.ps1 -React -Project D:\Projects\MyReactApp -StackOnly
```

### Bash / Shell (macOS / Linux / WSL)

```bash
# Make script executable
chmod +x ./install.sh

# 1. List all skills
./install.sh --list

# 2. Install ALL skills globally
./install.sh --global

# 3. Install only Flutter skills to a project
./install.sh --flutter --project ./my-flutter-app

# 4. Install only Laravel skills globally
./install.sh --laravel --global

# 5. Preview installation without writing files
./install.sh --all --dry-run
```

### Python CLI (Universal Cross-Platform)

```bash
# 1. List catalog
python install.py --list

# 2. Install all skills globally
python install.py --global --all

# 3. Install only Flutter skills to a project
python install.py --project /path/to/flutter_app --flutter

# 4. Install only Laravel skills to a project
python install.py --project /path/to/laravel_app --laravel

# 5. Install only React skills globally
python install.py --global --react
```

---

## Installation Targets & Flags

| Flag | Description | Default Behavior |
| :--- | :--- | :--- |
| `-Global` / `--global` / `--ide` | Installs to Antigravity global IDE config (`~/.gemini/config/skills`) | Default if no target provided |
| `-Project <path>` / `--project <path>` | Installs to `<path>/.agent/skills/` | Resolves target directory |
| `-All` / `--all` | Installs all 56 skills across all stacks | Enabled by default |
| `-Flutter` / `--flutter` | Installs Flutter skills (17) + Common workflow skills (9) | Stack + Common included |
| `-Laravel` / `--laravel` | Installs Laravel 13 skills (24) + Common workflow skills (9) | Stack + Common included |
| `-React` / `--react` | Installs React 19 skills (6) + Common workflow skills (9) | Stack + Common included |
| `-Common` / `--common` | Installs only the 9 universal workflow skills | Common only |
| `-StackOnly` / `--stack-only` | Excludes common workflow skills when installing a specific stack | Strict stack isolation |
| `-List` / `--list` | Prints the complete skills catalog with stack counts | Exits immediately |
| `-DryRun` / `--dry-run` | Previews planned file copies without writing to disk | Safe inspection |

---

## Skills Catalog

### Flutter Skills (17 Skills)

Designed for stable Flutter releases with Riverpod 3.0 code-generation and Clean Feature-First Architecture.

| Skill Name | Purpose & Capabilities |
| :--- | :--- |
| `flutter-api-contract-sync` | Compares Laravel API Resources with Flutter models to prevent schema mismatches and nullability errors. |
| `flutter-asset-registrar` | Automatically scans `assets/` and registers images, fonts, and icons in `pubspec.yaml` with typed constants. |
| `flutter-auditor` | Audits code for legacy anti-patterns (e.g. `Provider`, `Navigator.push`, untyped models). |
| `flutter-barrel-enforcer` | Generates and maintains clean `imports.dart` barrel files for feature modules. |
| `flutter-build-runner-sentinel` | Manages build_runner watches for Freezed, Riverpod, and JSON Serializable code generation. |
| `flutter-consumer-widget-generator` | Generates strict `ConsumerWidget` and `ConsumerStatefulWidget` components with pure UI decoupling. |
| `flutter-feature-scaffold` | Scaffolds a new feature module using Clean Architecture (`data/`, `domain/`, `presentation/`). |
| `flutter-json-to-dart-model` | Generates Freezed and `@JsonSerializable` Dart models with `fromJson`/`toJson` factory constructors. |
| `flutter-production-prep` | Prepares app for release: splash screens, launcher icons, dependency audits, and bundle cleanup. |
| `flutter-project-conventions` | Enforces naming, state management, routing, and directory conventions across the project. |
| `flutter-provider-scaffold` | Generates Riverpod 3.0 Notifiers with Freezed-backed immutable state models. |
| `flutter-repository-scaffold` | Generates feature data repositories and asynchronous data tables extending `BaseAsyncDataTableRepository`. |
| `flutter-resource-extractor` | Replaces hardcoded strings, dimensions, and asset paths with centralized project constants. |
| `flutter-riverpod-controller-generator` | Scaffolds `@riverpod` annotated AsyncNotifier controllers isolating business logic from widgets. |
| `flutter-router-generator` | Manages declarative GoRouter configurations, subroutes, redirection guards, and route constants. |
| `flutter-theme-manager` | Enforces centralized Material 3 theming using `ThemeData`, `ColorScheme`, and `ThemeExtensions`. |
| `flutter-very-good-analysis` | Configures and enforces Very Good Analysis lint rules with 100-character line width formatting. |

---

### Laravel 13 & PHP 8.5 Skills (24 Skills)

Engineered for Laravel 13 and PHP 8.5 utilizing Model-Service-Controller (MSC), skinny controllers, Pest PHP v4, and safe schema mutations.

| Skill Name | Purpose & Capabilities |
| :--- | :--- |
| `laravel-api-message-manager` | Enforces centralized response and log messages using `App\Constants\ApiMessages` with PHP 8.5 typed constants. |
| `laravel-api-resource-generator` | Generates Eloquent API Resources with explicit return shapes and `DateHelper` serialization. |
| `laravel-best-practices` | Full rule engine (19 comprehensive rules in `rules/`) covering queries, caching, queues, events, and security. |
| `laravel-controller-generator` | Generates thin controllers delegating all domain logic to services and returning standardized JSON. |
| `laravel-date-standardizer` | Normalizes date and timestamp serialization across API endpoints using project date helpers. |
| `laravel-enum-generator` | Generates PHP 8.5 string-backed enums with `label()`, `values()`, and query helper methods. |
| `laravel-feature-scaffold` | Orchestrates end-to-end scaffolding of a backend feature across Model, Migration, Service, Controller, and Policy. |
| `laravel-form-request-generator` | Generates Form Requests enforcing type-safe validation rules, authorization logic, and error messages. |
| `laravel-infer-conventions` | Audits an existing Laravel codebase against standard architectural conventions (`references/checklist.md`). |
| `laravel-job-generator` | Scaffolds queued jobs with `ShouldQueue`, PHP 8.5 property promotion, and service injection in `handle()`. |
| `laravel-log-bridge` | Correlates frontend 5xx errors directly with local Laravel application exceptions and stack traces. |
| `laravel-mailable-generator` | Generates queued mailables adhering to modern `Envelope` and `Content` definition syntax. |
| `laravel-middleware-generator` | Scaffolds custom middleware classes configured via modern `bootstrap/app.php`. |
| `laravel-migration-safety-checker` | Validates migration safety: enforces full attribute re-declaration on `->change()`, FK naming, and reversibility. |
| `laravel-model-generator` | Generates Eloquent models adhering to Laravel 13 standards with `protected function casts(): array`. |
| `laravel-msc-architecture` | Enforces MSC + RPR architecture with complete reference implementations in `examples/`. |
| `laravel-openapi-sync` | Synchronizes `routes/api.php` endpoints with OpenAPI specifications and detects undocumented routes. |
| `laravel-policy-generator` | Scaffolds authorization policies with granular role-based and ownership permissions. |
| `laravel-response-standardizer` | Wraps API outputs using centralized `ResponseHelper` and `PaginationHelper` formats. |
| `laravel-schema-validator` | Validates migrations and MySQL schemas for naming, primary keys, and InnoDB engines (`scripts/validate_schema.py`). |
| `laravel-service-generator` | Generates dedicated business logic services using structured result-array returns and audit logging. |
| `laravel-test-generator` | Scaffolds Pest PHP v4 tests with strict dataset isolation and architecture testing rules. |
| `laravel-testing-best-practices` | Comprehensive testing guidelines (9 rules in `rules/`) for Pest unit, feature, and endpoint tests. |
| `laravel-to-flutter-bridge` | Translates Laravel Resources, Enums, and contracts into Flutter Dart models and serializers. |

---

### React 19 Skills (6 Skills)

Tailored for modern React 19 applications using functional components, modern hook idioms, Inertia.js, and Tailwind CSS v4.

| Skill Name | Purpose & Capabilities |
| :--- | :--- |
| `react-component-generator` | Scaffolds React 19 component directories with TypeScript (TSX), styles, and tests (ref-as-prop). |
| `react-hook-extractor` | Refactors complex components by extracting business logic and state into reusable custom hooks. |
| `react-lint-fix` | Audits and automatically fixes React 19 and TypeScript lint issues using ESLint 9 flat configurations. |
| `react-formatter` | Enforces Prettier 2-space indentation, no semicolons, and deterministic alphabetical import sorting. |
| `react-inertia-page-scaffold` | Generates React 19 + Inertia pages integrated with shared layouts, typed props, and page metadata. |
| `tailwindcss-development` | Crafts accessible, responsive UI with Tailwind CSS v4 utility classes and theme tokens. |

---

### Universal & Workflow Skills (9 Skills)

Cross-cutting productivity and engineering discipline tools available across all stacks.

| Skill Name | Purpose & Capabilities |
| :--- | :--- |
| `git-smart-commit` | Intelligently inspects git diffs, detects project stack (Flutter/Laravel/React), and formats Conventional Commits. |
| `code-review` | Performs multi-stack code reviews evaluating correctness, edge cases, Riverpod, Laravel 13, and React 19 standards. |
| `env-variable-guard` | Validates `.env` and environment configurations against codebase usages to eliminate missing variable crashes. |
| `feature-interrogator` | Conducts a structured requirement interview before coding to eliminate ambiguities. |
| `doc-generator` | Analyzes code structure to automatically generate organized Markdown documentation. |
| `doc-updater` | Detects documentation drift and updates stale documentation to match current implementations. |
| `organize-docs` | Restructures documentation directories into clean, standardized hierarchies (`scripts/organize_template.ps1`). |
| `license-header-adder` | Automatically adds standardized license headers across Dart, PHP, TSX, and JavaScript files. |
| `previous-task` | Reviews previous task trajectories for quality assurance, logic oversights, and regression prevention. |

---

## Antigravity Architecture & Integration

Google Antigravity discovers skills using **Progressive Disclosure**:
1. At session startup, Antigravity loads only the `name` and `description` from each skill's `SKILL.md` frontmatter into its awareness index.
2. The agent activates the full instructions, rules, and scripts of a skill only when relevant to the user's prompt or task.
3. Customizations are discovered hierarchically:
   - **Project Level**: `.agent/skills/` (shared with the team via VCS).
   - **Global Level**: `~/.gemini/config/skills/` (available across all workspaces on your machine).

---

## Repository Structure

```text
skills/
├── skills/                             # The single consolidated skills folder (56 skills)
│   ├── flutter-api-contract-sync/
│   ├── flutter-asset-registrar/
│   ├── ...
│   ├── laravel-api-resource-generator/
│   ├── laravel-best-practices/
│   │   └── rules/                      # 19 specialized rule guides
│   ├── laravel-msc-architecture/
│   │   └── examples/                   # Modern Laravel 13 reference models and services
│   ├── laravel-schema-validator/
│   │   └── scripts/                    # validate_schema.py engine
│   ├── react-component-generator/
│   ├── git-smart-commit/
│   └── ...
├── install.ps1                         # Native PowerShell 7 installer
├── install.sh                          # Native POSIX / Bash installer
├── install.py                          # Cross-platform Python installer CLI
├── skills.json                         # Skills manifest & category definitions
└── README.md                           # Master documentation
```

---

## License

This repository is distributed under the MIT License.
