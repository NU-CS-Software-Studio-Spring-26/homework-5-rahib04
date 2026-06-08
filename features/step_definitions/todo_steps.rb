Given("the following todos exist:") do |table|
  table.hashes.each do |row|
    Todo.create!(description: row["description"], category: row["category"])
  end
end

When("I visit the todos index") do
  visit todos_path
end

When("I filter by {string}") do |category|
  select(category, from: "category")
  click_button "Filter"
end

Then(/I should see "(.*)"/) do |text|
  if page.has_content?(text)
    expect(page).to have_content(text)
  else
    raise "Expected to see #{text}"
  end
end

Then(/I should not see "(.*)"/) do |text|
  expect(page).not_to have_content(text)
end
