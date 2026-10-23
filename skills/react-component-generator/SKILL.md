---
name: react-component-generator
description: "Scaffold React 19 component folders adhering to modern React conventions (ref as prop, TSX, CSS modules/Tailwind, test files)."
---

# React Component Generator Skill

## Goal
To maintain a consistent "Feature-First" architecture by scaffolding component folders instead of single files.

## Instructions
1.  **Path Resolution**: Determine the target directory (default to `src/presentation/components` if not specified).
2.  **Naming**: Convert the user's name to PascalCase (e.g., "login form" -> `LoginForm`).
3.  **File Creation**: Create a folder named `<ComponentName>` containing:
    * `<ComponentName>.tsx`: A functional component using `React.FC`.
    * `<ComponentName>.module.css` (or `.scss`): Scoped styles.
    * `<ComponentName>.test.tsx`: A basic Vitest/Jest render test.
4.  **Boilerplate**:
    * Use **Functional Components** with hooks.
    * Ensure all UI logic is extracted to separate helper classes or hooks if complex.
5.  **Summary**: Report the directory structure created.

## Example
* *Input*: "Create a button component in the shared folder."
* *Action*: Creates `src/presentation/components/shared/Button/` with all three files.

## React 19 Conventions
- **Ref as Prop**: Pass `ref` directly as a component prop; do NOT wrap components in `forwardRef`.
- **Server vs Client**: Use `'use client'` directive only when client interactivity, state, or effects are needed.
- **Form Actions**: Leverage React 19 Actions and `useActionState` for form submission handlers.
