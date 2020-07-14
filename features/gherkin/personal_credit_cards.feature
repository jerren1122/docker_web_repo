Feature: Personal credit cards
  @regression
  Scenario: pcc Navigation
    Given the user navigates to the landing page
    When the user clicks personal credit cards
    Then the user validates the url contains credit-cardssss

  @regression
  Scenario: pcc Validation
    Given the user navigates to the landing page
    And the user validates the element personal credit cards displays
