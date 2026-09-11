#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh cursor [project_dir]
  ./install.sh claude [project_dir]
  ./install.sh antigravity [project_dir]
  ./install.sh codex
  ./install.sh codex-project [project_dir]
  ./install.sh all [project_dir]

Defaults:
  project_dir = current working directory
  CODEX_HOME  = ~/.codex
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

require_dir() {
  local path="$1"
  [[ -d "$path" ]] || die "missing package directory: $path"
}

install_cursor() {
  local project_dir="${1:-$PWD}"
  local dest="$project_dir/.cursor/rules"
  require_dir "$ROOT/cursor"
  mkdir -p "$dest"
  cp "$ROOT"/cursor/*.mdc "$dest/"
  echo "Installed Cursor rules -> $dest"
}

install_claude() {
  local project_dir="${1:-$PWD}"
  local dest="$project_dir/.claude/rules"
  require_dir "$ROOT/claude"
  mkdir -p "$dest"
  cp "$ROOT"/claude/*.md "$dest/"
  echo "Installed Claude Code rules -> $dest"
}

install_antigravity() {
  local project_dir="${1:-$PWD}"
  local dest="$project_dir/.agents/rules"
  require_dir "$ROOT/antigravity"
  mkdir -p "$dest"
  cp "$ROOT"/antigravity/*.md "$dest/"
  echo "Installed Antigravity rules -> $dest"
}

install_codex() {
  local codex_home="${CODEX_HOME:-$HOME/.codex}"
  require_dir "$ROOT/codex"
  mkdir -p "$codex_home/rules"
  cp "$ROOT/codex/AGENTS.md" "$codex_home/AGENTS.md"
  cp "$ROOT/codex/config.toml" "$codex_home/config.toml"
  cp "$ROOT"/codex/rules/*.md "$codex_home/rules/"
  echo "Installed Codex global config -> $codex_home"
  echo "  AGENTS.md, config.toml, and rules/ library"
}

install_codex_project() {
  local project_dir="${1:-$PWD}"
  local dest="$project_dir/AGENTS.md"
  require_dir "$ROOT/codex/project-python"
  mkdir -p "$project_dir"
  if [[ -e "$dest" ]]; then
    die "refusing to overwrite existing $dest (move it aside first)"
  fi
  cp "$ROOT/codex/project-python/AGENTS.md" "$dest"
  echo "Installed Codex Python project AGENTS.md -> $dest"
}

target="${1:-}"
shift || true

case "$target" in
  cursor)
    install_cursor "${1:-$PWD}"
    ;;
  claude)
    install_claude "${1:-$PWD}"
    ;;
  antigravity)
    install_antigravity "${1:-$PWD}"
    ;;
  codex)
    install_codex
    ;;
  codex-project)
    install_codex_project "${1:-$PWD}"
    ;;
  all)
    project_dir="${1:-$PWD}"
    install_cursor "$project_dir"
    install_claude "$project_dir"
    install_antigravity "$project_dir"
    install_codex
    ;;
  ""|-h|--help|help)
    usage
    ;;
  *)
    usage
    die "unknown target: $target"
    ;;
esac
