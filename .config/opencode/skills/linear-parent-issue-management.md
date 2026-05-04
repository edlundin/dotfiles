# Skill: Linear Parent Issue Management

## Goal

Maintain the parent issue as the single source of truth for a feature, from first
planning through definition of done.

## Rules

- Title must begin with `[AI-PARENT]`
- Label: `ai:parent`
- State starts at `Planning` and is updated as work progresses
- Issue body must follow the `feature-parent.md` template — do not invent a
  different structure

## Keeping the body current

The issue body is a living document, not a snapshot. Update it as the feature
evolves:

- When a question is answered, check it off and move the answer into `Assumptions`
  or `Proposed Solution` as appropriate
- When an objection is resolved, mark it `[resolved]` in `Objections and Resolutions`
- When a work unit is created, add the sub-issue link to `Work Units`
- When a risk is retired, remove or strike it

Do not leave resolved questions or objections open. Do not bury decisions in comment
threads — the body is where decisions live.

## Anti-patterns

- Storing any part of the plan in local files or markdown docs
- Writing long narrative comments instead of updating the issue body
- Using a structure other than `feature-parent.md`