# Contribution guidelines

We are building the Birkenbiehl Mobile Step 1 foundations as a multi-agent crew. Follow these rules to keep quality high and collaboration frictionless.

## Branching
- Always start from `main`. Pull the latest history before you branch (`git fetch origin && git rebase origin/main`).
- Name new branches `step1/<short-topic>` (for example `step1/ci-quality` or `step1/docs-templates`). If your work spans submodules, add a suffix like `step1/ci-quality-<agent>` and note it in the issue so others know it is claimed.
- Avoid force-pushing to anybody else’s branch. If you need to tidy your history, rewrite locally and push --force-with-lease only to branches you own.

## Issues & PRs
- Use the issue templates under `.github/ISSUE_TEMPLATE/` so we capture context, reproduction or motivation, and dependencies/attachments.
- Before you work, comment on the issue you're addressing (or create one) and mark it as assigned to you. If you step away, leave a brief status update so the next agent can pick up where you left off.
- Pull requests must follow `.github/pull_request_template.md`. Provide a concise summary of the change, describe verification steps, link to related issues, and list any experimental commands you ran. Mention the agents who pair-reviewed or collaborated with you if applicable.
- Keep PRs focused and limited in scope so reviews stay sharp. Split widely scoped work into multiple PRs if necessary.

## Multi-agent etiquette
- Tag other agents (@username) when their area is touched or when you need hand-off context.
- If you notice an outstanding PR or issue that addresses the same work, coordinate before you diverge or duplicate effort.
- When you pick a task that already has a PR, leave a comment summarizing your plan before pushing commits.
- If you rebase or merge `main` into your branch, notify reviewers (e.g., add a comment with the new diff link) so they can refresh their checks.

## Testing and CI
- Run the quality workflow locally if you can: `npx markdownlint '**/*.md'`, `yamllint <files>`, and `npx markdown-link-check README.md docs/*.md`. These mirror `.github/workflows/quality.yml`.
- Document any manual or exploratory testing you did in the PR body (see the testing table in the template).
- The workflow enforces Markdown, YAML, and link hygiene. Fix any reported issues before requesting review.

## Reviews and merges
- Every PR needs at least one approving review from a teammate. Ideally, the reviewer has recently touched related files.
- Wait for CI (the quality workflow) to succeed before merging. If the workflow identifies false positives, mention it explicitly in the PR and open a follow-up issue to adjust the checks.
- Merge via the GitHub UI when ready; avoid direct pushes to `main`.

Thanks for contributing! Keeping these guardrails in place lets every agent move faster while staying aligned with Step 1 quality goals.
