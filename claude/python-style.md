---
description: Python style, clean code, naming, functions, modules, classes, and Python-specific conventions.
paths:
  - "**/*.py"
---

# Python Style and Clean Code Rules

## Language and Text

* Simplified Chinese must not appear anywhere in source code.
* Write all code comments, docstrings, identifiers, test names, fixture names, module names, log keys, and technical metadata in English.
* If Chinese text is required for user-facing labels, reports, UI copy, notifications, or output messages, use Traditional Chinese only.
* Preserve the established language and terminology of existing user-facing content unless the task requests a rewrite.
* Do not add comments that merely restate the code. Explain intent, constraints, tradeoffs, or non-obvious decisions.

## General Clean Code

* Prefer explicit, readable code over clever or overly compact code.
* Use intention-revealing and searchable names.
* Keep each unit at one level of abstraction.
* Avoid hidden global state and implicit coupling.
* Avoid unnecessary abstractions, wrappers, indirection, and premature generalization.
* Extract duplication only when the shared concept is stable and meaningful.
* Prefer domain types over loosely structured dictionaries or primitive values when they clarify contracts.
* Keep constants named and close to the domain that owns them.
* Make invalid states difficult to represent.
* Apply the Boy Scout Rule: leave touched code cleaner than you found it without widening the task unnecessarily.

## Naming

* Names must explain what an object represents, what a function does, or why a value exists.
* Use nouns or noun phrases for classes and data structures.
* Use verbs or verb phrases for functions and methods.
* Name Boolean values and predicates so they read as true-or-false statements, such as `is_active`, `has_access`, or `can_retry`.
* Avoid vague names such as `Manager`, `Data`, `Processor`, `Helper`, `Utils`, `Common`, or `Misc` unless the responsibility is genuinely precise.
* Avoid single-letter variables except in very small scopes or conventional mathematical notation.
* Do not encode types in names. Use the language's type system instead.
* Use consistent domain terminology across code, tests, APIs, and documentation.

## Functions and Methods

* Keep functions small, focused, and cohesive.
* A function should usually remain below 20 logical lines, but cohesion and readability take priority over a mechanical limit.
* Each function should do one thing at one level of abstraction.
* Prefer zero, one, or two arguments. When several related arguments travel together, introduce a typed parameter object or configuration object.
* Avoid Boolean flag arguments that switch a function between unrelated behaviors.
* Prefer early returns over deeply nested control flow.
* Extract complex conditions into named predicates.
* Avoid hidden side effects.
* Follow Command Query Separation: a command changes state; a query returns information without changing state.
* Do not split a readable operation into trivial pass-through functions solely to satisfy a line-count guideline.

## Modules and File Size

* Keep each source file focused on one cohesive responsibility or reason to change.
* A source file should normally remain below 300 logical lines.
* When a file exceeds 300 logical lines, evaluate whether it contains multiple responsibilities and split it by domain boundary when useful.
* Files exceeding 500 logical lines require an explicit architectural justification.
* Do not append new behavior to an oversized module without first evaluating a safe extraction.
* Split modules by responsibility, lifecycle, or dependency boundary, not by arbitrary line count.
* Avoid dumping-ground modules such as `utils`, `helpers`, `common`, or `misc`.
* Do not create many tiny files that obscure navigation or introduce meaningless indirection.

## Class and Object Design

* Follow the Single Responsibility Principle.
* A class should have one clear reason to change.
* A class should normally remain below 200 logical lines and expose no more than seven public methods.
* Treat size thresholds as review triggers, not excuses for mechanical fragmentation.
* Prefer high cohesion: most methods should use most of the object's state.
* If groups of methods use unrelated state, extract separate collaborators.
* Prefer composition over inheritance unless inheritance models a true subtype relationship.
* Follow the Law of Demeter and avoid train-wreck calls such as `a.get_b().get_c().do_something()`.
* Do not use a class merely as a namespace for unrelated functions.
* Do not create `Manager`, `Service`, or `Coordinator` classes without a precise, narrow responsibility.

## Style and Types

* Use 4 spaces for indentation.
* Follow the project's configured formatter and linter. Otherwise follow PEP 8 and use Black-compatible formatting.
* Use complete type hints for all functions and methods, including return types.
* Prefer modern built-in generic types when supported by the project's Python version.
* Prefer f-strings over `.format()` or string concatenation.
* Use `pathlib.Path` for filesystem paths unless an API requires strings.
* Use `dataclasses`, typed models, enums, or protocols when they clarify contracts.
* Avoid `Any`; when unavoidable at an external boundary, contain and validate it immediately.
* Avoid blanket type suppressions. Narrow every suppression and explain non-obvious cases.

## Python Functions and APIs

* Use keyword-only arguments when several same-typed values could be confused.
* Do not use mutable default arguments.
* Prefer iterators for streaming large data and concrete collections when repeated access is required.
* Return consistent types across all code paths.
* Use `Protocol` for structural dependency contracts when inheritance is unnecessary.
* Keep public APIs explicit with `__all__` when a module exposes a deliberate surface.

## Python Error Handling

* Raise specific exception types with actionable messages.
* Do not use bare `except` or catch `Exception` unless operating at a process boundary where errors are logged and handled intentionally.
* Use exception chaining with `raise ... from error` when translating exceptions.
* Do not use exceptions for ordinary control flow.
* Define domain-specific exceptions only when callers can handle them meaningfully.

## Python Resources and I/O

* Use context managers for files, locks, transactions, and other managed resources.
* Specify text encodings explicitly, normally UTF-8.
* Avoid loading unbounded files or responses fully into memory when streaming is practical.
* Use `subprocess` without `shell=True` unless shell behavior is essential and all input is trusted and controlled.
* Set explicit timeouts for subprocess and network operations.
* Keep synchronous blocking I/O out of async event loops.

## Python Project Structure

* Keep import-time behavior minimal and deterministic.
* Do not perform network calls, database access, or application startup during module import.
* Separate CLI parsing, application wiring, domain logic, and infrastructure adapters.
* Guard executable entry points with `if __name__ == "__main__":`.
* Avoid circular imports by correcting responsibility boundaries rather than using local imports as a default workaround.
* Place tests according to the repository's established layout and mirror domain organization where practical.

## Python Tooling

* Use the project's existing toolchain and configuration.
* When available, run the relevant subset of:
  * Formatter checks, such as Black or Ruff format.
  * Lint checks, such as Ruff.
  * Static type checks, such as mypy or Pyright.
  * Tests, such as pytest.
* Do not introduce a second formatter, linter, type checker, or test framework without a clear need.
