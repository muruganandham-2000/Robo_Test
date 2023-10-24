Feature: Calculator
  Scenario: Add two numbers
    Given I have entered first value as 70 and second value as 50 into the calculator
    When I press add
    Then the result should be 120 on the screen
