Feature: View the home page

  Scenario: I can see options spec form and default chart on the homepage
    When I visit homepage
    Then I see the chart params form for ticker "SPY"
    And I see the chart for ticker "SPY"


  Scenario: I can see new chart by changing ticker symbol
  Scenario: I can see correctly inferred option params
  Scenario: I can see the right option chart
