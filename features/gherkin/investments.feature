Feature: Investments test
  @regression
  Scenario: Investments Navigation
    Given the user navigates to the landing page
    When the user clicks investments
    Then the user validates the url contains investment

  @regression
  Scenario: Investments Validation
    Given the user navigates to the landing page
    And the user validates the element Investments displays