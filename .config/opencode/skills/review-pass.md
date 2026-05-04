# Skill: Review Pass

## Goal

Verify that the completed output matches the Linear parent issue and each work unit's
acceptance criteria. The review pass runs after all work units are done and final
validation has passed.

## When it runs

After `final-validation` completes successfully. Do not run a review pass on a build
that is still failing.

## Who runs it

The challenger role (see `pair-programming-driver-challenger`). The driver should not
self-review their own output as the sole reviewer.

## Procedure

1. Open the Linear parent issue. Read the definition of done and the work-unit list.
2. For each work unit, check the implementation against its acceptance criteria.
3. For the feature as a whole, check against the parent issue's definition of done.
4. Look for:
   - spec mismatch — behavior that diverges from what was specified
   - unfinished edge cases — gaps identified during planning that were not resolved
   - weak tests — tests that pass but do not actually verify the acceptance criteria
   - hidden regressions — side effects on behavior outside the work unit's scope
   - unnecessary abstractions — complexity introduced beyond what the spec required
   - scope creep — code that was not part of any work unit and was not approved

## Findings

- Minor issues: leave a `[REV]` comment in the relevant Linear sub-issue.
- Spec mismatches or failing criteria: raise an `[OBJ]` in the parent issue and
  stop. Do not mark the feature done. Ask the user for direction.
- If everything passes: leave a single `[REV]` comment on the parent issue confirming
  the review and referencing the definition of done.

## Rule

A feature is not done until the review pass completes without open objections.