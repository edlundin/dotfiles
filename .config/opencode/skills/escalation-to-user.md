# Skill: Blocked — Escalation to User

## Goal

Handle situations where an agent cannot proceed without external input, without
silently guessing or working around the problem.

## What counts as blocked

- A decision is required that is not covered by existing assumptions
- An objection has been raised and the coordinator has not resolved it
- The codebase contradicts the spec in a way that affects the work unit's scope
- A dependency (external service, missing data, unclear API contract) is unresolved
- Two valid interpretations exist and choosing the wrong one carries real risk

## Procedure

1. Stop. Do not guess, do not proceed on an assumption that should be a decision.
2. Leave a `[Q]` comment in the relevant Linear issue — state the blocker, the
   impact, and what decision is needed. Keep it under 8 lines.
3. If the blocker invalidates a work unit or the parent issue's definition of done,
   leave an `[OBJ]` on the parent issue as well.
4. Surface the blocker clearly to the user and wait for instruction.

## What a good blocker comment looks like

```text
[Q] Token refresh behavior on concurrent requests is unspecified.
    Two strategies are possible: queue and replay, or return 401.
    Choice affects error handling in three work units. Needs a decision before proceeding.
```

## Rule

An agent that proceeds through a blocker by silently assuming an answer is not
helping — it is creating hidden risk. Stopping is the correct move.