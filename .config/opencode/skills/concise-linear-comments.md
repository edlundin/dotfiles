# Skill: Concise Linear Comments

## Goal

Leave short, parseable comments in Linear.

## Preferred length

3 to 8 lines.

## Approved prefixes

| Tag | Meaning |
|-----|---------|
| `[Q]` | Question — something that needs an answer before proceeding |
| `[A]` | Assumption — a decision made in the absence of a clear answer |
| `[R]` | Result — outcome of a step or decision |
| `[V]` | Validation — test or verification result |
| `[L]` | Lint — formatting or static analysis result |
| `[REV]` | Review — code or design review note |
| `[OBJ]` | Objection — challenger raises a concern that must be resolved |

## Pattern

State the point, the impact, and only the minimum evidence.

## Examples

```text
[Q] Expiry behavior unspecified. Affects accept flow + tests.
[A] Assume 7-day expiry to proceed.
[OBJ] Current plan ignores duplicate-email handling.
```
