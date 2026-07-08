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
