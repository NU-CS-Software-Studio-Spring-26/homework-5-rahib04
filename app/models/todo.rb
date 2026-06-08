class Todo < ApplicationRecord
  validates :description, presence: true
  CATEGORY_OPTIONS = ["work", "study", "home chores", "personal"].freeze

  validates :category, presence: true, inclusion: { in: CATEGORY_OPTIONS }

  def self.with_category(category)
    return all if category.blank? || category == "All"

    where(category: category)
  end
end
