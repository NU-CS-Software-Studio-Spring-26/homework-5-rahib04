require "rails_helper"

RSpec.describe Todo, type: :model do
  describe ".with_category" do
    it "returns only todos in the selected category" do
      Todo.create!(description: "Work task", category: "work")
      Todo.create!(description: "Study task", category: "study")

      results = Todo.with_category("work")
      expect(results.map(&:description)).to contain_exactly("Work task")
    end
  end
end
