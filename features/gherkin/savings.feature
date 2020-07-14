Feature: Savings
  @regression
  Scenario: Savings Navigation
    Given the user navigates to the landing page
    When the user clicks savings
    Then the user validates the url contains savings

  @regression
  Scenario: Savings Validation
    Given the user navigates to the landing page
    And the user validates the element savings displays