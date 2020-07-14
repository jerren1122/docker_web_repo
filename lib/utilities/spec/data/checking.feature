Feature: Checking tests
  @regression
  Scenario: Checking Navigation
    Given the user navigates to the landing page
    When the user clicks Checking
    Then the user validates the url contains checking

  @regression
  Scenario: Checking Validation (Good)
    Given the user navigates to the landing page
    And the user validates the element checking displays