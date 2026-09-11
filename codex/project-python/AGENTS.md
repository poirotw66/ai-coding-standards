# Project Engineering Instructions

This is a Python project.

In addition to the user's global engineering instructions:

## Python

- Follow PEP 8 and the repository formatter/linter configuration.
- Use complete type hints for functions and methods.
- Prefer explicit, readable code over clever implementations.
- Prefer pathlib.Path for filesystem operations.
- Prefer modern built-in generic types.
- Avoid Any unless required at an external boundary.
- Use specific exceptions and preserve exception causes.
- Keep import-time behavior minimal.
- Keep domain logic independent from infrastructure where practical.

## Architecture

- Separate domain logic, infrastructure, interfaces, and application wiring.
- Inject external dependencies explicitly.
- Validate data at trust boundaries.
- Define API and persistence contracts explicitly.
- Use explicit timeouts for network, database, subprocess, and model calls.
- Use retries only for transient idempotent operations.
- Never silently swallow exceptions.

## Testing

- Add or update tests for changed behavior.
- Test failure paths and edge cases, not only happy paths.
- Prefer focused tests over unnecessarily broad integration tests.

## Full Reference

For detailed conventions, see the shared rules library installed under `$CODEX_HOME/rules/`
(or this repository's `shared/` directory):

- `python-style.md`
- `system-design.md`
- `testing.md`
- `data-analysis.md` when working on analysis or notebooks
