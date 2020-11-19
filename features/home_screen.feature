@HomeScreen
Feature: Test for Home screen functionality

  Background: 
    Given I land on Home screen

  @tag1
  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  @DefaultEnableElement
  Scenario: Show all button should be enabled at launch
    When I press on main button
    Then Show all button should be disabled
    When I type "2" on application keyboard
    Then Show all button should be enabled

  @DefaultConversion
  Scenario Outline: Verify default conversion
    When I press on main button
    And I type "<target>" on application keyboard
    Then I should see result as "<result>"
    Examples:
      | target | result   |
      | 1      | 30.48    |
      | 2      | 60.96    |
      | 3      | 91.44    |
      | 9      | 274.32   |
      |10      | 304.8    |
      |1011    | 30 815.28|

  @addFavorite
  Scenario: User able to add current conversion to favorite list
    Then I press on Add to favorites icon
    Then I press on menu icon
    Then I press on Favorite conversion
    And I verify "Length" added to Favorite conversions list

  @SelectPickers
  Scenario Outline: User able to select values from unit pickers
    Then I press on main button
    And I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<result>"

  Examples:
    | unit_type | amount  | result  |
    | Inch      | 1       | 2.54    |
    | Kilometer | 1       | 100 000 |

  @SelectConverter  
  Scenario: User able to convert values
    Then I select "Volume" from menu
    And I select "Cup" from right unit picker
    When I type "2" on application keyboard
    Then I should see result as "15.1416"

  @SwitchConvertor
  Scenario: User be able to switch values
    Then I press on main button
    And Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    When I press on switch units button
    Then Left unit picker value should be "Centimeter"
    And Right unit picker value should be "Foot"

