# Rails Store

## Source of truth
- docs/requirements.md — project brief, domain model, ticket breakdown.
  Tickets are referenced as BE-x / FE-x / SH-x. Read the ticket AND the
  domain model table before starting work.
- docs/contracts.md — agreed interface contracts (SH-1). Never violate
  these; if a ticket seems to require it, stop and ask.

## Commands
- Specs: `bundle exec rspec` (a single file: `bundle exec rspec spec/models/product_spec.rb`)
- Run: `bin/rails server` (http://localhost:3000)
- New checkout/worktree setup: `bundle install && bin/rails db:prepare && bin/rails db:seed`

## Test strategy (SH-2 — follow it)
- Unit specs (models, mailers): no DB where avoidable — build/build_stubbed
- Integration/request specs touching the DB: tag :clean_db, create own data
- Feature specs (Capybara): smoke tests for user stories only
- FactoryBot for all test data; factories live in spec/factories/

## Rules
- Only edit files your ticket names; stay inside its Owner track
- Run `bundle exec rspec` before declaring any ticket done
- MIGRATIONS: only create a migration if your ticket explicitly includes one
  (BE-2, BE-4, BE-6 do). NEVER edit db/schema.rb by hand. At most ONE
  migration-bearing ticket may be in flight at a time.
- Prefer Rails generators (bin/rails generate model/controller/scaffold/
  migration) over hand-writing boilerplate; layer domain edits on top
- Never modify Gemfile or Gemfile.lock unless the ticket is a dependency change
- ERB escapes by default — never use raw/html_safe on user content
- The 0 → positive inventory business rule (requirements §2) is load-bearing:
  BE-5 owns it; no other ticket may touch it


<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:6cd5cc61 -->
## Beads Issue Tracker

This project uses **bd (beads)** for issue tracking. Run `bd prime` to see full workflow context and commands.

### Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> --claim  # Claim work
bd close <id>         # Complete work
```

### Rules

- Use `bd` for ALL task tracking — do NOT use TodoWrite, TaskCreate, or markdown TODO lists
- Run `bd prime` for detailed command reference and session close protocol
- Use `bd remember` for persistent knowledge — do NOT use MEMORY.md files

**Architecture in one line:** issues live in a local Dolt DB; sync uses `refs/dolt/data` on your git remote; `.beads/issues.jsonl` is a passive export. See https://github.com/gastownhall/beads/blob/main/docs/SYNC_CONCEPTS.md for details and anti-patterns.

## Agent Context Profiles

The managed Beads block is task-tracking guidance, not permission to override repository, user, or orchestrator instructions.

- **Conservative (default)**: Use `bd` for task tracking. Do not run git commits, git pushes, or Dolt remote sync unless explicitly asked. At handoff, report changed files, validation, and suggested next commands.
- **Minimal**: Keep tool instruction files as pointers to `bd prime`; use the same conservative git policy unless active instructions say otherwise.
- **Team-maintainer**: Only when the repository explicitly opts in, agents may close beads, run quality gates, commit, and push as part of session close. A current "do not commit" or "do not push" instruction still wins.

## Session Completion

This protocol applies when ending a Beads implementation workflow. It is subordinate to explicit user, repository, and orchestrator instructions.

1. **File issues for remaining work** - Create beads for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **Handle git/sync by active profile**:
   ```bash
   # Conservative/minimal/default: report status and proposed commands; wait for approval.
   git status

   # Team-maintainer opt-in only, unless current instructions forbid it:
   git pull --rebase
   git push
   git status
   ```
5. **Hand off** - Summarize changes, validation, issue status, and any blocked sync/commit/push step

**Critical rules:**
- Explicit user or orchestrator instructions override this Beads block.
- Do not commit or push without clear authority from the active profile or the current user request.
- If a required sync or push is blocked, stop and report the exact command and error.
<!-- END BEADS INTEGRATION -->
