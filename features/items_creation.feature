Feature: Items creation

  Scenario: Items creation
    Given I visit homepage
    And I enter item name as 'Item One'
    And I click on Add
    Then I see the newly added item with name 'Item One'