# ai-coding-standards

Personal AI coding standards for engineering workflow, Python development, testing, and data analysis.

Works with [Cursor](https://cursor.com), [Claude Code](https://code.claude.com/docs), [Google Antigravity](https://antigravity.google/), and [OpenAI Codex](https://openai.com/codex/).

## Layout

```text
ai-coding-standards/
├── shared/                 # Source-of-truth rule bodies (no tool frontmatter)
├── cursor/                 # Cursor .mdc packages
├── claude/                 # Claude Code .md packages (paths frontmatter)
├── antigravity/            # Antigravity .md packages (trigger frontmatter)
├── codex/
│   ├── AGENTS.md           # Global personal instructions for ~/.codex/
│   ├── config.toml         # developer_instructions
│   ├── rules/              # Full rule library for reference / project use
│   └── project-python/     # Template AGENTS.md for Python repos
└── install.sh
```

## Shared rules

| File | Scope intent | Description |
|------|--------------|-------------|
| [`shared/engineering-standards.md`](shared/engineering-standards.md) | Always | Change planning, documentation, git hygiene, anti-patterns, DoD |
| [`shared/python-style.md`](shared/python-style.md) | Python | Language, clean code, naming, functions, modules, classes |
| [`shared/system-design.md`](shared/system-design.md) | Python | Architecture, reliability, security, API contracts, concurrency |
| [`shared/testing.md`](shared/testing.md) | Tests | pytest testing rules and test quality standards |
| [`shared/data-analysis.md`](shared/data-analysis.md) | Analysis | Data analysis, statistics, visualization, notebooks |

## Quick install

```bash
./install.sh cursor /path/to/project
./install.sh claude /path/to/project
./install.sh antigravity /path/to/project
./install.sh codex
./install.sh codex-project /path/to/python-project
./install.sh all /path/to/project
```

`CODEX_HOME` defaults to `~/.codex`.

## Codex (recommended hierarchy)

Codex scopes instructions by **directory hierarchy**, not Cursor-style globs.

It loads `$CODEX_HOME/AGENTS.md` first, then project / nested `AGENTS.md` files. More specific directories win.

```text
~/.codex/config.toml          # how Codex should work
~/.codex/AGENTS.md            # your global engineering habits
~/.codex/rules/               # full library (reference; copy into projects as needed)
project/AGENTS.md             # this repo's stack and conventions
src/special-module/AGENTS.md  # optional domain-specific constraints
```

### Global personal rules

```bash
./install.sh codex
```

This installs:

```text
~/.codex/
├── AGENTS.md      # curated from engineering-standards (language-agnostic)
├── config.toml    # implementation-first developer_instructions
└── rules/         # full shared library for project reuse
```

Do **not** dump every Python-specific rule into the global `AGENTS.md`. Global instructions should stay language-agnostic; otherwise Codex may apply Python conventions while editing TypeScript.

### Python project rules

```bash
./install.sh codex-project /path/to/python-project
```

Creates a concise project `AGENTS.md` that assumes the global personal instructions and adds Python / architecture / testing guidance.

For deeper detail, point the project at `$CODEX_HOME/rules/` or copy selected files from `shared/`.

### Manual fallback

```bash
mkdir -p ~/.codex
curl -L \
  https://raw.githubusercontent.com/poirotw66/ai-coding-standards/main/codex/AGENTS.md \
  -o ~/.codex/AGENTS.md
```

That is a minimal “works now” install. Prefer `./install.sh codex` so `config.toml` and `rules/` are included.

## Cursor

```bash
./install.sh cursor /path/to/project
```

Copies `cursor/*.mdc` into `.cursor/rules/`.

Cursor can scope with globs:

```yaml
---
description: Short summary shown in the rule picker.
globs:
  - "**/*.py"
alwaysApply: true
---
```

## Claude Code

```bash
./install.sh claude /path/to/project
```

Copies `claude/*.md` into `.claude/rules/`.

| This repo intent | Claude Code |
|------------------|-------------|
| Always-on | omit `paths` |
| File-scoped | `paths:` globs |

Personal global rules: `~/.claude/CLAUDE.md` or `~/.claude/rules/`.

See the [Claude Code memory docs](https://code.claude.com/docs/en/memory).

## Antigravity

```bash
./install.sh antigravity /path/to/project
```

Copies `antigravity/*.md` into `.agents/rules/` (`.agent/rules/` is still supported by Antigravity).

| This repo intent | Antigravity |
|------------------|-------------|
| Always-on | `trigger: always_on` |
| File-scoped | `trigger: glob` + `globs` |

Global Antigravity rules: `~/.gemini/GEMINI.md`.

See the [Antigravity Rules docs](https://antigravity.google/docs/rules-workflows/).

## Cross-tool guidance

- Keep **shared/** as the source of truth for detailed conventions.
- Keep **Codex global `AGENTS.md`** short and language-agnostic.
- Put stack-specific rules in **project `AGENTS.md`** (Codex) or tool-native scoped rule files (Cursor / Claude / Antigravity).
- Avoid duplicating the same rule in global + project files with conflicting wording.

## Conventions

- Source code, comments, and docstrings: English
- User-facing Chinese text: Traditional Chinese only (no Simplified Chinese in code)
