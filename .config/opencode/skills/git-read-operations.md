# Skill: Git — Read Operations

## Goal

Use Git effectively for exploration and understanding, within the constraint that
agents have read-only access to the repository. All mutations are performed by the user.

## What agents may do

- `git log` — inspect commit history, find relevant changes, understand authorship
- `git diff` — compare branches, commits, or files to understand what changed
- `git show` — read a specific commit's content
- `git blame` — trace the origin of a specific line or block
- `git grep` — search for patterns across the repo history or working tree
- `git ls-files` — list tracked files, useful for scoping a work unit
- `git status` — understand the current state of the working tree (read only)

## What agents may not do

Agents must not execute any command that mutates repository state:

- `git commit`, `git add`
- `git checkout`, `git switch`, `git restore`
- `git branch` (creation or deletion)
- `git merge`, `git rebase`, `git cherry-pick`
- `git push`, `git pull`, `git fetch`
- `git reset`, `git revert`, `git stash`
- `git worktree add`

If a proposed change requires a mutation, surface the exact command and its intent
to the user and let the user execute it.

## Practical use

Before planning a work unit, use `git log` and `git grep` to understand the history
of the relevant area. Use `git diff` to verify what has actually changed against
what was expected. Reference specific commits in Linear comments when relevant.

## Rule

If you find yourself wanting to run a write command, stop. Surface the need to the
user. Do not attempt to work around the constraint.