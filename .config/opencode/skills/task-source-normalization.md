# Skill: Task Source Normalization

## Goal

Normalize a source task from any system into the Linear parent issue format.
The source of implementation intent — a prompt, a ticket reference, a spec doc —
does not matter. The output is always a structured Linear parent issue.

## Supported sources

- ClickUp
- Jira
- GitHub
- Linear
- manual prompt
- markdown / doc

## Procedure

1. Capture from the source:
   - system and external ID (if applicable)
   - URL (if present)
   - raw summary or description
2. Extract:
   - stated goal
   - explicit requirements
   - unstated but likely requirements
   - obvious missing decisions
3. Write or update the Linear parent issue with what you have.
4. **Run `spec-hardening` next.** Normalization captures what was said;
   spec hardening challenges whether it is sufficient.

## Result

The source becomes a structured parent issue. No local plan file is created.
The parent issue is the plan from this point forward.