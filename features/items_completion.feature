Feature: Items completion

  Background: Items completion
  	Given I visit homepage
  	And I clear all existing items
    And I enter item name as 'Item Some'
    And I click on Add

  Scenario: Items marking as completed
    Given I check the checkbox of 'Item Some'
    Then Item should be marked as complete

  Scenario: Items are incomplete by default
    Then Item should be marked as incomplete

  Scenario: Items are marked incomplete on unchecking
  	Given I check the checkbox of 'Item Some'
  	And I uncheck the checkbox of 'Item Some'
    Then Item should be marked as incomplete