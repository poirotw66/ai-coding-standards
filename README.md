# cursor-rule

Personal AI coding rules for engineering workflow, Python development, testing, and data analysis.

Works with [Cursor](https://cursor.com), [Claude Code](https://code.claude.com/docs), [Google Antigravity](https://antigravity.google/), and [OpenAI Codex](https://openai.com/codex/).

## Rules

| File | Scope | Description |
|------|-------|-------------|
| [`engineering-standards.mdc`](engineering-standards.mdc) | Always | Change planning, documentation, git hygiene, anti-patterns, and definition of done |
| [`python-style.mdc`](python-style.mdc) | `**/*.py` | Language, clean code, naming, functions, modules, classes, and Python conventions |
| [`system-design.mdc`](system-design.mdc) | `**/*.py` | Architecture, reliability, security, API contracts, concurrency, observability, dependencies, and configuration |
| [`testing.mdc`](testing.mdc) | `**/test_*.py`, `**/*_test.py`, `**/tests/**/*.py` | pytest testing rules and test quality standards |
| [`data-analysis.mdc`](data-analysis.mdc) | `**/*.py`, `**/*.ipynb` | Data analysis, statistics, visualization, and notebook conventions |

## Install

### Cursor

Copy the `.mdc` files into the target project's `.cursor/rules/` directory:

```bash
mkdir -p /path/to/project/.cursor/rules
cp *.mdc /path/to/project/.cursor/rules/
```

Or add them as user rules in Cursor settings.

Cursor frontmatter example:

```yaml
---
description: Short summary shown in the rule picker.
globs:
  - "**/*.py"
alwaysApply: true
---
```

### Claude Code

Claude Code reads project memory from `CLAUDE.md` (or `.claude/CLAUDE.md`) and modular rules from `.claude/rules/*.md`.

Recommended for this repo: copy into `.claude/rules/` as `.md` files.

```bash
mkdir -p /path/to/project/.claude/rules
cp engineering-standards.mdc /path/to/project/.claude/rules/engineering-standards.md
cp python-style.mdc /path/to/project/.claude/rules/python-style.md
cp system-design.mdc /path/to/project/.claude/rules/system-design.md
cp testing.mdc /path/to/project/.claude/rules/testing.md
cp data-analysis.mdc /path/to/project/.claude/rules/data-analysis.md
```

Then convert frontmatter:

| This repo (Cursor) | Claude Code |
|--------------------|-------------|
| `alwaysApply: true` (no path scope) | omit `paths` (loads at launch) |
| `globs: ["**/*.py"]` | `paths:` with the same patterns |

Always-on (no path filter):

```yaml
---
description: Engineering workflow and definition of done
---
```

Path-scoped:

```yaml
---
description: Python style and clean code
paths:
  - "**/*.py"
---
```

```yaml
---
description: pytest testing rules
paths:
  - "**/test_*.py"
  - "**/*_test.py"
  - "**/tests/**/*.py"
---
```

Alternatively, merge selected rule bodies into a single `/path/to/project/CLAUDE.md`.

Personal rules for every project: `~/.claude/CLAUDE.md` or `~/.claude/rules/`.

See the [Claude Code memory docs](https://code.claude.com/docs/en/memory).

### Antigravity

Antigravity reads workspace rules from `.agents/rules/` (`.agent/rules/` is still supported). Rules must be `.md` files with Antigravity frontmatter.

1. Copy the rule contents into the target project.
2. Rename `.mdc` → `.md`.
3. Convert frontmatter:

| This repo (Cursor) | Antigravity |
|--------------------|-------------|
| `alwaysApply: true` | `trigger: always_on` |
| `globs: ["**/*.py"]` | `trigger: glob` + `globs: "**/*.py"` |

Example:

```bash
mkdir -p /path/to/project/.agents/rules
cp engineering-standards.mdc /path/to/project/.agents/rules/engineering-standards.md
cp python-style.mdc /path/to/project/.agents/rules/python-style.md
cp system-design.mdc /path/to/project/.agents/rules/system-design.md
cp testing.mdc /path/to/project/.agents/rules/testing.md
cp data-analysis.mdc /path/to/project/.agents/rules/data-analysis.md
```

Then edit each file's frontmatter. Always-on:

```yaml
---
trigger: always_on
description: Engineering workflow and definition of done
---
```

Glob-scoped:

```yaml
---
trigger: glob
description: Python style and clean code
globs: "**/*.py"
---
```

You can also create rules from the IDE: Agent panel → `...` → Customizations → Rules → **+ Workspace**.

Global Antigravity rules live in `~/.gemini/GEMINI.md`.

See the [Antigravity Rules docs](https://antigravity.google/docs/rules-workflows/).

### Codex

Codex primarily reads `AGENTS.md` at the project root (plain Markdown).

1. Create `/path/to/project/AGENTS.md`.
2. Paste the rule sections you want Codex to follow (or merge the `.mdc` bodies into one file).

Cross-tool tip:

- Keep shared conventions in `AGENTS.md` for Codex / Cursor / Antigravity / Claude Code where possible.
- Put Antigravity-only overrides in `GEMINI.md` (takes precedence when both exist).
- Put Claude Code-only overrides in `CLAUDE.md` or `.claude/rules/`.

## Conventions

- Source code, comments, and docstrings: English
- User-facing Chinese text: Traditional Chinese only (no Simplified Chinese in code)
