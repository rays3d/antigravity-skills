---
name: react-formatter
description: "Standardize React codebases with Prettier 2-space indentation, no semicolons, and alphabetical import sorting."
---

# React Master Formatter Skill

## Goal
To maintain a clean, minimalist ("no-semi") codebase with consistent 2-space indentation and predictable, alphabetically sorted import structures.

## Instructions

### 1. Environment & Dependency Check
Verify that the project has the necessary formatting tools in `package.json`. If missing, install them:
```bash
npm install -D prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-simple-import-sort
```

### 2. Configuration Enforcement
Ensure the following standards are present:

#### Prettier (`.prettierrc.json`)
```json
{
  "semi": false,
  "tabWidth": 2,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 100,
  "bracketSpacing": true
}
```

#### ESLint (`eslint.config.js` or `.eslintrc`)
Integrate `simple-import-sort` and `prettier` rules:
- `simple-import-sort/imports`: `"error"`
- `simple-import-sort/exports`: `"error"`
- `prettier/prettier`: `["error", { "semi": false }]`

### 3. Formatting Execution
Run the formatting pipeline on the target React directory (usually `resources/js` or `src`):
1.  **Direct Formatting**: `npx prettier --write "path/to/js/**/*.{js,jsx}"`
2.  **Lint & Sort**: `npx eslint "path/to/js/**/*.{js,jsx}" --fix`

## Verification
- Run `npx eslint "path/to/js/" --max-warnings 0` post-fix.
- **Pass**: If no errors remain, report: "React codebase formatted and sorted successfully."
- **Fail**: If errors persist (e.g. syntax errors preventing fix), report the specific files requiring manual attention.

## Example
* **Trigger**: "Format the react components and sort the imports."
* **Action**: Updates configuration if needed, then runs Prettier and ESLint fix.
* **Output**: "Standardized 42 files. Imports sorted alphabetically and spacing set to 2-space minimalist style."
