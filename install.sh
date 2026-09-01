#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
mode="${1:-install}"
target="$repo_root/global/AGENTS.md"
destination="$HOME/.codex/AGENTS.md"

case "$mode" in
  install) ;;
  --check | check) mode="check" ;;
  *)
    echo "Usage: ./install.sh [--check]" >&2
    exit 2
    ;;
esac

if [ "$mode" = "check" ]; then
  if [ -L "$destination" ] && [ "$(readlink "$destination")" = "$target" ]; then
    echo "ok   $destination"
    exit 0
  fi
  echo "fail $destination -> $target" >&2
  exit 1
fi

if [ -L "$destination" ] && [ "$(readlink "$destination")" = "$target" ]; then
  exit 0
fi
if [ -e "$destination" ] || [ -L "$destination" ]; then
  echo "Refusing to replace existing path: $destination" >&2
  exit 1
fi

mkdir -p "$(dirname -- "$destination")"
ln -s "$target" "$destination"
echo "Linked InKCre common instructions from $repo_root"
echo "Restart Codex to reload instructions."
