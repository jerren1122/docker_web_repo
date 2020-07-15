Feature: Contact us validation
  @regression
  Scenario: Contact us 1
    Given the user navigates to the landing page
    When the user clicks contact us
    Then the user validates the url contains index

  @regression
  Scenario: Contact us 2
    Given the user navigates to the landing page
    And the user validates the element contact us displays

  @regression
  Scenario: Contact us 3
    Given the user navigates to the landing page
    And the user validates the element contact_us_form displays