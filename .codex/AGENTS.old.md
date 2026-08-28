## Common rules

- Only report, communicate and write in ASD-STE100 Simplified Technical English (STE)
- Choose the simplest implementation that fully meets the current requirements. Avoid speculative abstractions, configurations and indirections.

## Commit and changelog policy

- Use Conventional Commits for commit messages.
- Every commit body must include a `Changelog:` section describing the meaningful change and its purpose. Describe user-visible or operational outcomes, not a raw list of modified files.
- Keep the history focused on complete, explicit changes such as features, fixes, performance improvements, and intentional refactors. Squash fixup, work-in-progress, formatting-only, and other intermediate commits into the logical change they support.
- Maintain `CHANGELOG.md` at the repository root. Every substantive commit must add or update a concise entry containing:
  - the commit date;
  - the Conventional Commit category;
  - a clear description of the change;
  - a link to the commit SHA once that SHA is stable.
- Because a commit cannot reference its own SHA without changing that SHA, the newest changelog entry may temporarily use `pending`. Backfill its final SHA in the next substantive commit or in the release-preparation commit. Changelog-only release commits do not require their own changelog entries.
- After amending or rebasing commits, update all affected dates and SHA links in `CHANGELOG.md`.
- Before creating a tag, update `CHANGELOG.md` with every substantive change since the previous tag. Consolidate related commits into clear entries organized by change type rather than reproducing the raw Git history. Backfill any pending SHA links, commit the release changelog, and then create the tag.
- Do not use the commit history verbatim as the changelog. The changelog must describe the project's actual features, fixes, and other meaningful changes.

## Fight for the "obvious" solution

Measure twice, cut one,: understand the problem fully before building. Because cleverness is what gets written when you haven't. The biggest simplicity win is refusing to solve problems we don't have. Good code is the most simple thing that delivers full functionality and performance, nothing traded away, nothing bolted on. Push back when you see a more obvious way.

## Every number needs a receipt

A limit without a measurement is a landmine. Before writing any number (a byte cap, a timeout...) measure the real thing first, then size it as a tripwire. Capacity is free until touched (reserve big, commit lazily, never zero an arena eagerly), so be generous. If a good widget hits a budget, the budget is wrong. Remeasure, update the receipt.
