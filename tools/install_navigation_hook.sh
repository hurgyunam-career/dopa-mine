#!/bin/sh
set -eu

REPO_ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
SOURCE="$REPO_ROOT/.githooks/pre-commit"
TARGET_DIR="$REPO_ROOT/.git/hooks"
TARGET="$TARGET_DIR/pre-commit"

if [ ! -f "$SOURCE" ]; then
  echo "Hook source not found: $SOURCE" >&2
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Git hooks directory not found: $TARGET_DIR" >&2
  exit 1
fi

cp "$SOURCE" "$TARGET"
chmod +x "$TARGET"
echo "Installed pre-commit hook: $TARGET"
