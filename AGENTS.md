## Stack

Rails 8.1.3 sample todo app, SQLite, ERB + Hotwire (Turbo/Stimulus via importmap) + Propshaft, Jbuilder, Minitest (system tests: Capybara + Selenium), Solid Queue (background jobs) / Solid Cache / Solid Cable.

## Commands

- **Setup**: `bin/setup`
- **Run**: `bin/dev`
- **Test**: `bin/rails db:test:prepare test test:system`
- **Lint**: `bin/rubocop`

## Conventions

- **Naming**: resource is `Todo` / `TodosController`; views live under `app/views/todos/`.
- **Authorization**: no authorization/authentication layer is present in this repo.
- **Controller responses**: controllers respond to **HTML and JSON** (via `respond_to` in `TodosController` and `.jbuilder` views). No Turbo Stream-specific responses/templates are present.
- **Shared partials**: put shared view code in partials under the resource folder (e.g. `app/views/todos/_form.html.erb`, `app/views/todos/_todo.html.erb`).

## Don'ts

- **No new gems without approval**.
- **No unpinned JS deps**: don’t introduce new frontend packages without updating importmap (CI runs `bin/importmap audit`).
- **Do not commit secrets**: don’t commit deploy secrets (e.g. `RAILS_MASTER_KEY`) or any sensitive values in credentials/environment files.

