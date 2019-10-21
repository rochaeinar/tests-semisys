Feature: Create a subject

  Scenario: Create a Subject
    Given I have authenticated as user "admin" with password "admin"
    When I call to the create subject Resource
    Then I get an CREATED response
    And the response has the following details:
      | status  | 201                 |
      | message | Successful creation |

  Scenario: Read a Subject
    Given I have authenticated as user "admin" with password "admin"
    When I call to the read "subject" Resource
    Then I get an OK response
    And the response has the following details:
      | status  | 200 |
      | message | OK  |
