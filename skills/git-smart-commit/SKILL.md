---
name: git-smart-commit
description: "Stage related changes and generate Conventional Commit messages tailored automatically for Flutter, Laravel, or React."
---

# Smart Committer Skill (Conventional Commits)

Maintain a clean, searchable git history by strictly adhering to the **Conventional Commits** specification across **Flutter**, **Laravel**, and **React** codebases.

## Goal
Enforce structured commit messages (`feat`, `fix`, `chore`, `refactor`, `style`, `test`, `docs`) tailored to the project stack.

## Instructions

1. **Status & Stack Inspection**:
   - Run `git status` to examine modified, added, and untracked files.
   - Detect project stack:
     - **Flutter**: `.dart`, `pubspec.yaml`, `lib/` -> use scopes like `(auth)`, `(ui)`, `(router)`, `(deps)`.
     - **Laravel**: `.php`, `composer.json`, `app/` -> use scopes like `(api)`, `(service)`, `(migration)`, `(model)`.
     - **React**: `.tsx`, `.jsx`, `package.json`, `src/` -> use scopes like `(components)`, `(hooks)`, `(pages)`, `(styles)`.

2. **Diff Verification**:
   - Run `git diff --staged` or `git diff` to understand exact changes before committing.
   - Ensure secrets, `.env`, or temporary files are NOT staged.

3. **Message Formatting**:
   - Format: `<type>(<scope>): <short description in imperative present tense>`
   - Examples:
     - `feat(auth): implement Riverpod auth controller and login form`
     - `feat(order): add OrderService result-array processing in Laravel 13`
     - `fix(button): update Tailwind v4 focus state and aria-disabled in React 19`
     - `refactor(models): migrate Eloquent casts to casts() method`
     - `chore(deps): upgrade very_good_analysis to latest stable`

4. **Execution**:
   - Stage relevant files with `git add <files>`.
   - Never commit without explicit user confirmation if user rules require consent.
