---
trigger: glob
description: pytest testing rules and test quality standards.
globs: "**/test_*.py,**/tests/**/*.py,**/*_test.py"
---

# Python Testing Rules

## Testing Framework

* Use `pytest` for all tests.
* Do not use `unittest` unless maintaining legacy code that already depends on it.
* Test code must be as clean and maintainable as production code.

## Test Design

* Add or update tests for every meaningful behavior change.
* Test observable behavior rather than private implementation details.
* Cover the happy path, important edge cases, and expected failure paths.
* Add a regression test when fixing a defect whenever practical.
* Each test should verify one concept.
* Test names should describe the scenario and expected outcome.
* Prefer Arrange-Act-Assert structure.
* Keep tests deterministic, isolated, and readable.
* Do not use arbitrary sleeps to coordinate tests.
* Tests should not depend on execution order.
* Tests should not require network access unless explicitly marked as integration tests.

## F.I.R.S.T. Principles

Tests must be:

* Fast
* Independent
* Repeatable
* Self-validating
* Timely

## Fixtures and Setup

* Use fixtures for reusable setup.
* Keep fixtures small, focused, and intention-revealing.
* Avoid fixture chains that make tests hard to understand.
* Prefer explicit local setup when it improves test readability.
* Avoid shared mutable state across tests.

## Mocking

* Mock only external boundaries or expensive nondeterministic collaborators.
* Avoid over-mocking the unit under test.
* Good mock targets include:

  * External APIs
  * Databases
  * Filesystems
  * Network calls
  * Time-dependent behavior
  * Model inference services
* Do not mock code just to make fragile implementation-specific assertions.

## Assertions

* Use clear, direct assertions.
* Avoid multiple unrelated assertions in the same test.
* Prefer asserting observable behavior over private implementation details.
* Use `pytest.raises` for expected exceptions.
* Avoid vague assertions such as checking only that a result is not `None`.

## Test Data

* Keep test data minimal and meaningful.
* Use descriptive names for test inputs and expected outputs.
* Avoid random values unless the randomness is seeded and intentional.
* Do not use production data in tests unless it is anonymized and explicitly approved.

## Failure Handling

* Do not delete, skip, or weaken a failing test merely to make the suite pass.
* If a test cannot be run, state exactly why and what remains unverified.

## Language Rules for Tests

* Simplified Chinese must not appear anywhere in test code.
* Test names, fixtures, comments, and docstrings must be written in English.
* If Chinese user-facing expected output is required, use Traditional Chinese only.
