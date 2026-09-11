---
trigger: glob
description: Architecture, reliability, security, API contracts, concurrency, observability, dependencies, and configuration.
globs: "**/*.py"
---

# System Design and Reliability Rules

## Architecture and Boundaries

* Separate startup, dependency wiring, configuration, and runtime behavior.
* Keep object construction in application entry points, factories, builders, or dependency containers.
* Business logic must receive external collaborators through explicit dependencies.
* Keep domain logic independent from frameworks when practical.
* Do not mix I/O, validation, transformation, business rules, persistence, and presentation in the same function.
* Make boundaries explicit for external APIs, databases, filesystems, queues, model inference, user interfaces, and reporting outputs.
* Translate external representations into internal domain types at system boundaries.
* Prevent transport-layer or persistence-layer details from leaking into domain logic.
* Prefer stable interfaces between modules and keep implementation details private.
* Avoid circular dependencies. Dependency direction should point toward stable domain concepts.

## Error Handling and Reliability

* Prefer exceptions or explicit typed results over error codes.
* Never silently swallow exceptions.
* Catch only exceptions that can be handled meaningfully at that layer.
* Keep `try` and `except` blocks narrow.
* Preserve the original cause when translating exceptions.
* Add actionable context to errors without exposing secrets or sensitive data.
* Avoid returning or passing `None` when a clearer design is possible.
* When absence is valid, represent it explicitly in the type system and handle it close to the boundary.
* Define timeouts for network, database, subprocess, and model calls.
* Use retries only for transient and idempotent operations, with bounded attempts and backoff.
* Do not retry validation failures, authorization failures, or deterministic application errors.
* Design state-changing operations to be idempotent when retries or duplicate delivery are possible.
* Clean up resources deterministically with context managers or equivalent language constructs.

## Security and Privacy

* Treat all external input as untrusted.
* Validate input at trust boundaries and reject invalid data with clear errors.
* Apply least privilege to credentials, permissions, tools, files, and network access.
* Never hard-code secrets, tokens, passwords, private keys, or production credentials.
* Never log secrets, authentication headers, session identifiers, personal data, or full sensitive payloads.
* Use parameterized queries and safe APIs. Do not construct executable commands, SQL, HTML, or URLs through unsafe interpolation.
* Normalize and validate filesystem paths before access. Prevent path traversal and unintended overwrite.
* Verify authorization independently from authentication.
* Use secure defaults and fail closed for access-control decisions.
* Do not weaken TLS verification, certificate validation, security controls, or guardrails to make a test pass.
* For AI systems, treat prompts, retrieved content, tool output, and model output as untrusted data.
* Enforce tool permissions and data-access policies outside the model.
* Require explicit confirmation for destructive or high-impact actions when the product design calls for it.

## Data and API Contracts

* Define request, response, event, and persistence schemas explicitly.
* Validate required fields, types, ranges, formats, and invariants at boundaries.
* Keep API behavior backward compatible unless a versioned breaking change is requested.
* Distinguish omitted values, explicit null values, and empty collections when their meanings differ.
* Use stable machine-readable error codes together with safe human-readable messages when APIs require them.
* Do not expose internal stack traces or implementation details to clients.
* Make pagination, ordering, filtering, time zones, and timestamp formats explicit.
* Store and transmit timestamps with timezone information; prefer UTC internally.
* Plan data migrations with forward compatibility, rollback considerations, and safe deployment order.

## Concurrency and State

* Make ownership and lifecycle of mutable state explicit.
* Prefer immutable data where practical.
* Do not rely on process-local state for correctness in distributed or horizontally scaled systems.
* Protect shared mutable state with an appropriate synchronization or transactional mechanism.
* Avoid holding locks across network or other slow I/O operations.
* Account for duplicate events, out-of-order delivery, partial failure, and concurrent updates.
* Use transactions only around the smallest coherent consistency boundary.

## Observability

* Log meaningful events at appropriate levels with structured fields when supported.
* Include correlation identifiers for cross-service operations where available.
* Log enough context to diagnose failures without exposing sensitive information.
* Do not use logs as a substitute for correct error propagation.
* Add metrics for important latency, throughput, failure, retry, and saturation behavior when operationally relevant.
* Make health checks lightweight and representative of the component's actual readiness.
* Avoid high-cardinality metric labels derived from users, raw errors, prompts, or request identifiers.

## Dependencies

* Prefer the standard library and existing project dependencies when they adequately solve the problem.
* Add a dependency only when its maintenance, security, license, size, and operational cost are justified.
* Do not add a package for trivial functionality.
* Pin or constrain dependency versions according to the project's existing policy.
* Update lockfiles when dependency declarations change.
* Do not upgrade unrelated dependencies as part of a focused task.
* Remove dependencies that become unused because of the change.

## Configuration

* Keep environment-specific values outside source code.
* Validate configuration during startup and fail with an actionable message.
* Use typed configuration objects rather than reading environment variables throughout business logic.
* Document required configuration without including secret values.
* Provide safe local-development defaults only when they cannot be mistaken for production settings.
* Keep feature flags temporary, named clearly, and easy to remove.
