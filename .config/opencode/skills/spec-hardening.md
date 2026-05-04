# Skill: Spec Hardening

## Goal

Turn a vague request into a durable spec that serves the user's goal.

## Method

1. Identify ambiguity.
2. Infer likely intent.
3. Object to weak points.
4. Decide what can be made explicit safely.
5. Record short questions and assumptions in Linear.
6. Write a tighter solution into the parent issue.

## Typical weak spots

- missing lifecycle behavior
- auth and permission ambiguity
- duplicate or idempotency rules
- async vs sync side effects
- error semantics
- migration and rollback
- partial failure behavior
