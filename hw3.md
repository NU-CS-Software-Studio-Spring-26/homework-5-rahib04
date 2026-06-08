# Homework 3 Rails Todo Enhancements + Deployment

## Part 1: App enhancements (local)

### Files changed
- `config/routes.rb`
- `app/controllers/todos_controller.rb`
- `app/views/todos/_form.html.erb`
- `app/views/todos/_todo.html.erb`
- `Gemfile`
- `db/migrate/20260608120000_add_done_to_todos.rb`
- `db/schema.rb`

### 1) Add a `done` field

#### Migration added
```ruby
class AddDoneToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :done, :boolean, null: false, default: false
  end
end
```

#### Model schema update
`db/schema.rb` now includes:
```ruby
create_table "todos", force: :cascade do |t|
  t.datetime "created_at", null: false
  t.string "description"
  t.boolean "done", default: false, null: false
  t.datetime "due_date"
  t.datetime "updated_at", null: false
end
```

#### Form update
`app/views/todos/_form.html.erb`
```erb
  <div>
    <%= form.label :done, style: "display: block" %>
    <%= form.check_box :done %>
  </div>
```

#### Display update
`app/views/todos/_todo.html.erb`
```erb
  <p>
    <strong>Done:</strong>
    <%= todo.done? ? "Yes" : "No" %>
  </p>
```

#### Controller strong parameters
`app/controllers/todos_controller.rb`
```ruby
    def todo_params
      params.expect(todo: [ :description, :done ])
    end
```

### 2) Add a custom route named `new_todo`

`config/routes.rb` was updated to define a custom `new_todo` route and keep the rest of the Todo REST routes:
```ruby
resources :todos, except: :new
get '/todos/new', to: 'todos#new', as: :new_todo
```

### 3) Set the homepage

`config/routes.rb`
```ruby
root "todos#index"
```

## Part 2: Deploy to Heroku

- `Gemfile` production configuration updated to use PostgreSQL in production:
```ruby
group :production do
  gem "pg", "~> 1.1"
end
```
- `sqlite3` remains scoped to development/test.

### Deployed application URL
- Heroku app URL: https://salty-peak-45609-35042a6840e0.herokuapp.com/


