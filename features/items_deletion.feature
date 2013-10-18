Feature: Items deletion

  Background: Items deletion
  	Given I visit homepage
  	And I clear all existing items

  Scenario: Items deletion
  	Given I enter item name as 'Item Some'
    And I click on Add
    And I click on delete icon of 'Item Some'
    Then I should not find the item with name 'Item Some'