---
name: react-hook-extractor
description: "Extract state management and side effects from React 19 components into reusable custom hooks (useActionState, useOptimistic, use)."
---

# React Hook Extractor Skill

## Goal
To enforce "Thin Views" by moving state management and API calls from components into `use<Feature>` hooks.

## Instructions
1.  **Analyze**: Identify `useState`, `useEffect`, or API calls inside the provided component code.
2.  **Extraction**:
    * Create a new file `use<ComponentName>.ts` in a `hooks` or `logic` folder.
    * Move all identified logic into this hook.
    * Return only the necessary states and functions.
3.  **Refactor**:
    * Update the original component to call the new custom hook.
    * Destructure the returned values.
4.  **Verification**: Ensure no `useEffect` or complex logic remains in the `tsx` file except for event mapping.

## Example
* *Before*: `LoginForm.tsx` has 50 lines of validation and API logic.
* *After*: `useLoginForm.ts` contains the logic; `LoginForm.tsx` only contains the JSX and a call to the hook.
