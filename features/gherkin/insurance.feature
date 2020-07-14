Feature: Insurance Tests
  @regression
  Scenario: Insurance Navigation
    Given the user navigates to the landing page
    When the user clicks Insurance
    Then the user validates the url contains insurance

  @regression
  Scenario: Insurance Validation
    Given the user navigates to the landing page
    And the user validates the element Insurance displays