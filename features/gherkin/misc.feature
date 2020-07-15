Feature: misc feature

  @regression
  Scenario: button clicks 1
    Given the user navigates to the landing page
    And the user validates the element button_clicks displays

  @regression
  Scenario: button clicks 2
    Given the user navigates to the landing page
    When the user clicks button_clicks
    Then the user validates the url contains index

  @regression
  Scenario: button clicks 3
    Given the user navigates to the landing page
    When the user clicks button_clicks
    Then the user validates the url contains index

  @regression
  Scenario: to do list 1
    Given the user navigates to the landing page
    And the user validates the element to_do_list displays

  @regression
  Scenario: to do list 2
    Given the user navigates to the landing page
    When the user clicks to_do_list
    Then the user validates the url contains index

  @regression
  Scenario: Page Object Model 1
    Given the user navigates to the landing page
    And the user validates the element page_object_model displays

  @regression
  Scenario: Page Object Model 2
    Given the user navigates to the landing page
    When the user clicks page_object_model
    Then the user validates the url contains index

  @regression
  Scenario: Accordion 1
    Given the user navigates to the landing page
    And the user validates the element accordion displays

  @regression
  Scenario: Accordion 2
    Given the user navigates to the landing page
    When the user clicks accordion
    Then the user validates the url contains index

  @regression
  Scenario: Ajax 1
    Given the user navigates to the landing page
    And the user validates the element ajax displays

  @regression
  Scenario: Ajax 2
    Given the user navigates to the landing page
    When the user clicks ajax
    Then the user validates the url contains index

  @regression
  Scenario: Ajax 3
    Given the user navigates to the landing page
    When the user clicks ajax
    Then the user validates the url contains banana

