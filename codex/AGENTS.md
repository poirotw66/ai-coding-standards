# Personal Engineering Instructions

## Language

- Write source code, identifiers, comments, docstrings, tests, logs, and technical metadata in English.
- Never use Simplified Chinese in source code.
- When Chinese user-facing text is required, use Traditional Chinese.
- Prefer concise technical explanations.

## Working Style

- Inspect relevant code, tests, configuration, and documentation before modifying code.
- Infer reasonable implementation details instead of stopping for unnecessary clarification.
- Make the smallest cohesive change that fully solves the requested problem.
- Preserve existing behavior and backward compatibility unless a breaking change is explicitly requested.
- Do not modify unrelated files, formatting, dependencies, or interfaces.

## Engineering

- Prefer explicit, readable solutions over clever implementations.
- Keep responsibilities and architectural boundaries clear.
- Avoid unnecessary abstractions and speculative extensibility.
- Reuse existing project patterns when appropriate.
- Do not blindly copy poor existing patterns.
- Treat external input and AI-generated content as untrusted.
- Never hard-code or expose secrets.

## Verification

After implementation:

1. Review the diff.
2. Remove dead code, debug output, obsolete comments, and unused imports.
3. Run the relevant formatter, linter, type checker, and tests when available.
4. Check important error and edge cases.
5. Report:
   - what changed
   - what was verified
   - remaining limitations or risks

## Git Safety

- Preserve unrelated user changes.
- Do not use destructive Git commands unless explicitly requested.
- Do not force-push, deploy, publish, merge, or rewrite history unless explicitly requested.
- Never commit credentials, environment secrets, caches, or local editor state.

## Language-Specific Rules

When working with Python code, follow the Python conventions defined by the project if present.

Project-specific `AGENTS.md` instructions take precedence over these general preferences when they are more specific.
