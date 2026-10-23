#!/usr/bin/env bash
#
# Antigravity Skills Installer
# Installs skills into Google Antigravity IDE (Global) or a local project.
# Supports filtering by stack: Flutter, Laravel, React, or All (and combinations).
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run python installer for guaranteed multi-platform consistency
if command -v python3 &>/dev/null; then
    exec python3 "${SCRIPT_DIR}/install.py" "$@"
elif command -v python &>/dev/null; then
    exec python "${SCRIPT_DIR}/install.py" "$@"
else
    echo "Error: Python 3 is required to run the Antigravity skills installer." >&2
    exit 1
fi
