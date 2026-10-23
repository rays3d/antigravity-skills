---
name: laravel-log-bridge
description: "Correlate frontend HTTP 5xx errors with the latest Laravel server logs and stack traces during local development."
---

# Laravel Log Bridge

## Trigger

- Flutter reports an HTTP 5xx error (e.g. DioException).

## Actions

1. Read the latest entries from `storage/logs/laravel.log`.
2. Find the exception matching the failed request when possible.
3. Summarize:
   - Exception type
   - Error message
   - Source file and line
   - Top stack frame
4. If no matching exception exists, report that no related backend error was found.

## Output

- Flutter error
- Backend exception
- Source file:line
- Suggested root cause
