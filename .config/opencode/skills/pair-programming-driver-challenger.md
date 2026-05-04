# Skill: Pair Programming — Driver / Challenger

## Goal

Improve planning and implementation quality through structured disagreement.
This skill applies whenever a parent issue is being created, broken into sub-issues,
or a work unit is being implemented.

## Roles

**Driver:**
- proposes the plan or code
- optimizes for forward progress
- yields when a valid objection is raised

**Challenger:**
- pushes back on weak assumptions
- surfaces edge cases, missing criteria, and risky decisions
- raises objections with `[OBJ]` before the driver proceeds
- silence is not approval — if the challenger has not commented, the review has not happened

**Coordinator:**
- mediates unresolved disagreements
- decides the next step when driver and challenger conflict

## When this skill is active

Pair programming is required in two situations:
- **Planning** — creating a parent issue or splitting it into work units
- **Implementation** — executing any work unit

It is not optional in either case.

## Rule

The driver does not proceed past a raised `[OBJ]` until the coordinator resolves it.
An unreviewed plan or implementation is not considered complete.