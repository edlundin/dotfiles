# Skill: Repo Pattern Mapping

## Goal

Find the closest existing implementation pattern in the repo before planning or coding.
Adapting to what is already there produces more coherent, reviewable output than
importing conventions from outside.

## Procedure

1. Identify feature areas in the repo that are similar in kind to the work unit —
   same layer, similar domain, comparable complexity.
2. Read those areas and capture:
   - service / module structure
   - transaction and error handling patterns
   - how errors are mapped and surfaced
   - test style and coverage conventions
   - routing or controller structure if applicable
3. If no close pattern exists, note that explicitly in a `[A]` comment and state
   what you are defaulting to and why.
4. Reference the identified pattern in the work-unit execution comment before
   writing any code.

## Rule

Always adapt to the repo's existing conventions. If you find yourself introducing a
pattern not already present, that is a signal to pause and raise it as a `[Q]` or
`[OBJ]` before proceeding.