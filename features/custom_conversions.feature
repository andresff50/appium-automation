@CustomConversion
Feature: User able to create and manage custom conversions

  @CreateConversion    
  Scenario: User able to create new conversion
    Given I land on Home screen
    Then I press on menu icon
    Then I press on My conversions button
    Then I press on create your first conversion button
    And I type "Power" as custom conversion name
    When I press on new unit button
    Then I type "Horse power" as unit name
    Then I type "HP" as unit symbol
    Then I type "1" as unit value
    Then I press submit checkmark on custom conversions screen
    When I press on new unit button
    Then I type "Mule power" as unit name
    Then I type "MP" as unit symbol
    Then I type "0.5" as unit value
    Then I press submit checkmark on custom conversions screen
    When I press on OK button on Custom conversions screen
    Then I verify "Power" added to custom conversions list

  @SearchConversion
  Scenario: User able to search a conversion
    Given I land on Home screen
    Then I press on search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left unit picker value should be "Celsius"
    And Right unit picker value should be "Fahrenheit"

