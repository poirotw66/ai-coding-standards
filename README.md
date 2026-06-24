# cursor-rule

Personal [Cursor](https://cursor.com) rules for Python development, testing, and data analysis.

## Rules

| File | Scope | Description |
|------|-------|-------------|
| [`python-style.mdc`](python-style.mdc) | `**/*.py` | Python style, clean code, naming, functions, error handling, and system design |
| [`testing.mdc`](testing.mdc) | `**/test_*.py`, `**/*_test.py`, `**/tests/**/*.py` | pytest testing rules and test quality standards |
| [`data-analysis.mdc`](data-analysis.mdc) | `**/*.py`, `**/*.ipynb` | Data analysis, statistics, visualization, and notebook conventions |

## Usage

Copy the `.mdc` files into your project's `.cursor/rules/` directory, or add them as user rules in Cursor settings.

Each rule file uses frontmatter to control when it applies:

```yaml
---
description: Short summary shown in the rule picker.
globs:
  - "**/*.py"
alwaysApply: true
---
```

## Conventions

- Source code, comments, and docstrings: English
- User-facing Chinese text: Traditional Chinese only (no Simplified Chinese in code)
