Feature: Filter todos by category
  As a user
  I want to filter my todos by category
  So I can focus on related tasks

  Scenario: Filter by existing category
    Given the following todos exist:
      | description | category     |
      | Work A      | work         |
      | Study B     | study        |
    When I visit the todos index
    And I filter by "work"
    Then I should see "Work A"
    And I should not see "Study B"

  Scenario: Filter with no matches
    Given the following todos exist:
      | description | category     |
      | Study A     | study        |
    When I visit the todos index
    And I filter by "personal"
    Then I should see "No todos found"
