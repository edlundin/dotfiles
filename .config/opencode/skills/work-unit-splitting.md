# Skill: Work Unit Splitting

## Goal

Split a feature into bounded Linear sub-issues that an implementation subagent can
execute against without ambiguity.

## Each work unit body must follow `work-unit.md`

Do not invent a different structure. The template enforces the fields that
implementation, test, and review subagents depend on:

- Scope — what this unit does, in one or two sentences
- Pattern Reference — the existing file or service to follow (from `repo-pattern-mapping`)
- Allowed Files — the only files this unit may touch
- Forbidden Files — explicitly off-limits (default: everything else)
- Dependencies — other work units or external prerequisites
- Acceptance Criteria — what done looks like, testable and unambiguous
- Targeted Tests — the exact test command or file path, not a prose description

## Splitting guidance

Prefer splitting along these boundaries, in roughly this order:

1. Schema or migration — data changes first, everything else depends on them
2. Domain / service logic — core behavior isolated from transport
3. Interface layer — controllers, resolvers, handlers
4. Tests — if test scope warrants a dedicated unit
5. Final polish — only if genuinely separate from the above

Keep units small enough that a single implementation subagent can complete one
without needing to touch another unit's allowed files.

## When a work unit grows during implementation

If implementation reveals that a unit's scope must expand, the implementation
subagent stops, leaves an `[R]` comment, and waits for the coordinator to update
the work unit definition. Do not silently expand scope.