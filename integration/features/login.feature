Feature: Request a Login Resource

  Scenario: Request a Login Resource
    When I call to the login Resource
    Then I get an OK response
    And the response has the following details:
      | status  | 200 |
      | message | OK  |