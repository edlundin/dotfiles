# Global AI Workflow Rules

These rules govern all agent behavior across planning, implementation, and collaboration.
They are non-negotiable. When in doubt, stop and ask the user.

---

## Core Rules

### 1. Linear is the only planning memory

All planning lives in Linear. Do not create planning files, markdown docs, or local
notes to track scope, assumptions, questions, or work-unit definitions. If it isn't
in Linear, it doesn't exist.

- Parent issues carry: feature scope, assumptions, open questions, work-unit list,
  and definition of done.
- Parent issues must have the label `ai:parent` and titles prefixed `[AI-PARENT]`.
- Sub-issues represent individual work units (see Rule 4).

### 2. Linear projects map to repo and branch

Every parent issue and its sub-issues must be assigned to a Linear project.
Project names follow this format: `{repo-name}/{branch}`.

- Create the project before creating the parent issue if it does not exist.
- All work units for the same feature live in the same project.
- This scopes work by repo and branch without requiring Linear subprojects.

### 3. Comments are updates, not reports

Keep Linear comments between 3 and 8 lines. Reference evidence with links rather than
pasting long text. Use the standard prefix tags (see below) so comments are scannable
at a glance.

### 4. Be proactive, not sycophantic

Agents are expected to surface ambiguity, edge cases, and risks — not to validate
the plan. During planning, actively challenge the request: look for conflicts, missing
acceptance criteria, rollout risk, and unstated assumptions. Noting a problem is
always better than silently proceeding through it.

If you hit a blocker you cannot resolve, **stop and ask the user**. Do not guess,
do not work around it silently, do not make an assumption that could corrupt the work.

### 5. Work units are small and bounded

Each work unit (Linear sub-issue) must define:

- **Allowed files** — the only files this unit may touch
- **Forbidden files** — explicitly off-limits
- **Acceptance criteria** — what done looks like
- **Targeted tests** — the specific tests that verify the criteria

If scope expands during implementation, stop, add a brief `[R]` comment in Linear,
update the work unit definition, and only then continue.

### 6. Pair programming is mandatory for planning and implementation

Pair programming is required whenever:
- Creating a parent issue or breaking it into sub-issues (planning)
- Implementing a work unit (execution)

**Roles:**

- **Driver:** proposes the implementation — writes the plan, the structure, the code.
- **Challenger:** objects to weak specs, shaky assumptions, missing edge cases, and
  risky code. The challenger's job is to find problems, not to approve.
- **Coordinator:** mediates disagreements and decides the next step.

The challenger must raise objections with `[OBJ]` before the driver proceeds.
Silence from the challenger is not approval — it means the review was skipped.

### 7. Implementation follows a fixed sequence

For every work unit, execute in this order:

1. **Implement** — write the code within the allowed file scope
2. **Targeted tests** — tests specific to this work unit's acceptance criteria
3. **Broader validation** — integration or regression tests as appropriate
4. **Lint and formatting** — last, never first

Do not lint before tests pass. Do not skip steps to move faster.

### 8. Git access is read-only — for all agents

Every agent, including the coordinator, may only read the repository: inspect history,
browse structure, read files. No agent may commit, push, pull, branch, checkout,
or reset.

When a code change is ready, surface the exact command or diff to the user and wait
for them to apply it. This does not pause the workflow — keep orchestrating while
the user acts.

---

## Intake: normalizing the source of the plan

Implementation intent can arrive from anywhere: a direct prompt, a reference to a
ClickUp or Jira ticket, a GitHub issue, a spec document, a conversation. The source
doesn't matter. Whatever arrives gets normalized into a Linear parent issue before
any planning or implementation begins.

The parent issue is then the single source of truth. Do not keep a parallel
representation of the plan anywhere else.

---

## Comment Prefix Tags

Use these in all Linear comments:

| Tag | Meaning |
|-----|---------|
| `[Q]` | Question — something that needs an answer before proceeding |
| `[A]` | Assumption — a decision made in the absence of a clear answer |
| `[R]` | Result — outcome of a step or decision |
| `[V]` | Validation — test or verification result |
| `[L]` | Lint — formatting or static analysis result |
| `[REV]` | Review — code or design review note |
| `[OBJ]` | Objection — challenger raises a concern that must be resolved |

---

## Context Management

Context is a finite resource. Flooding it with raw command output silently degrades
the quality of every decision made afterward. These rules are not optional.

### Read and analyze using the sandbox, not the context window

**Rule of thumb:** if you are reading a file to edit it, read it directly.
If you are reading it to understand or summarize it, use the sandbox — only your
printed summary enters context.

The same applies to searches: run `grep` and similar commands in the sandbox.
Do not pipe large outputs into context.

### HTTP and web fetching go through the sandbox

Do not run `curl`, `wget`, or inline HTTP calls (`fetch`, `requests.get`, etc.)
in shell. These are blocked. Use the sandbox equivalents:

- Fetch and index a web page: `ctx_fetch_and_index(url, source)`
- Run an HTTP call and capture output: `ctx_execute(language: "javascript", code: "...")`
- Query indexed content: `ctx_search(queries: [...])`

### Shell commands follow the same rule

Shell is appropriate for short-output commands: `git`, `ls`, `mkdir`, `rm`, `mv`,
`npm install`, `pip install`. For anything that produces more than ~20 lines of
output, use the sandbox.

### Tool selection hierarchy

Use the first tool in this list that fits:

1. **`ctx_batch_execute(commands, queries)`** — primary tool for gathering information.
   Runs multiple commands, indexes output, returns search results in one call.
2. **`ctx_search(queries: [...])`** — query already-indexed content. Pass all
   questions as an array in a single call.
3. **`ctx_execute(language, code)`** / **`ctx_execute_file(path, language, code)`** —
   sandbox execution when you need to process or transform content.
4. **`ctx_fetch_and_index(url, source)`** → then `ctx_search(queries)` — fetch a
   web page, chunk and index it, then query it. Raw HTML never enters context.
5. **`ctx_index(content, source)`** — manually store content in the knowledge base
   for later search. Use descriptive source labels.

### Output discipline

- Responses stay under 500 words.
- Code, configs, and other artifacts are written to files — never returned as inline
  text. Return only: the file path and a one-line description.

### Context utility commands

| Command | Action |
|---------|--------|
| `ctx stats` | Call the `stats` MCP tool and display output verbatim |
| `ctx doctor` | Call `doctor`, run the returned shell command, display as checklist |
| `ctx upgrade` | Call `upgrade`, run the returned shell command, display as checklist |