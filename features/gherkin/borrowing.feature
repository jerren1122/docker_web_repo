Feature: Borrowing tests
  @regression
  Scenario: Borrowing Navigation
    Given the user navigates to the landing page
    When the user clicks borrowing 
    Then the user validates the url contains mortgages

    @regression
    Scenario: Borrowing Validation
      Given the user navigates to the landing page
      And the user validates the element borrowing displays
    