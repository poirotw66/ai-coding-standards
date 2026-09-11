# Engineering Standards

These rules define the default engineering standards for all code changes. More specific repository instructions may add stricter requirements but must not silently weaken these rules.

## Instruction Priority and Scope

* Follow explicit user requirements first, then repository-specific instructions, then this document.
* Inspect the relevant code, tests, configuration, and documentation before making changes.
* Make the smallest cohesive change that fully solves the requested problem.
* Do not modify unrelated behavior, formatting, dependencies, or public interfaces.
* Preserve backward compatibility unless a breaking change is explicitly requested.
* If requirements conflict or a choice would materially change behavior, explain the conflict and ask for clarification.

## Change Planning

Before implementation:

1. Identify the affected modules and their current responsibilities.
2. Locate relevant tests, interfaces, schemas, and configuration.
3. Determine the intended behavior, edge cases, and failure modes.
4. Decide whether the change belongs in an existing module or a new cohesive module.
5. Note any compatibility, migration, security, or operational impact.

During implementation:

* Keep changes within the requested scope.
* Reuse established project patterns when they remain appropriate.
* Do not copy a poor local pattern merely for consistency; improve it locally when safe.
* Do not perform unrelated large-scale refactoring during a focused change.
* If a larger refactor becomes necessary, explain why before expanding the scope.

After implementation:

1. Review the diff for accidental or unrelated changes.
2. Remove dead code, unused imports, obsolete comments, debug output, and redundant logic.
3. Run relevant formatting, linting, type checking, and tests.
4. Verify important failure paths, not only the happy path.
5. Report what changed, how it was verified, and any remaining risk or technical debt.

## Documentation

* Update documentation when public behavior, setup, configuration, architecture, or operational procedures change.
* Keep documentation close to the code or interface it explains.
* Document why a non-obvious decision exists, not every implementation detail.
* Keep examples executable and aligned with current APIs.
* Do not claim support, compatibility, or verification that was not actually established.

## Git and Repository Hygiene

* Preserve unrelated user changes in a dirty working tree.
* Review the existing diff before editing overlapping files.
* Do not use destructive Git commands unless explicitly requested.
* Do not commit generated caches, local environment files, credentials, build artifacts, or editor-specific state unless the repository intentionally tracks them.
* Keep generated files consistent with their source definitions.
* Do not rewrite history, force-push, publish, deploy, or create external changes unless explicitly authorized.
* Keep commits focused when the task includes committing changes.

## Anti-Patterns

Do not:

* Build a single-file implementation when domain, infrastructure, and interface concerns are distinct.
* Hide complexity behind many trivial pass-through functions or one-use abstractions.
* Add generic dictionaries where a typed object would make the contract clearer.
* Mix orchestration, business rules, persistence, network calls, and presentation formatting in one module.
* Create speculative extension points for hypothetical future requirements.
* Duplicate validation, authorization, retry, or serialization logic across boundaries.
* Introduce silent fallbacks that conceal invalid configuration or failed dependencies.
* Leave TODO comments without context, ownership, or a clear reason they cannot be resolved now.
* Optimize for line-count metrics at the expense of cohesion and readability.

## Definition of Done

A change is complete only when:

* The requested behavior is implemented within scope.
* Code and tests follow repository conventions and these rules.
* Relevant tests, linting, formatting, and type checks pass, or unverified checks are clearly reported.
* Error paths, security boundaries, and compatibility impacts have been considered.
* Documentation and configuration examples are updated when required.
* The final diff contains no debug artifacts, unrelated edits, dead code, or accidental secrets.
* The delivery summary states the changed behavior, verification performed, and any remaining limitations.
