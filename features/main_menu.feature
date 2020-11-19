@MainMenu
Feature: As a user I want to convert units

  @wip
  Scenario: I tap on menu icon, I should see left side menu
    Given I land on Home screen
    When I press on menu icon
    Then I should see left side menu

  @conversions
  Scenario: I should be able to open My conversions screen
    Given I land on Home screen
    When I press on menu icon
    And I press on My conversions button
    Then I land on My conversions screen