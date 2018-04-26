Feature: signup
  
  
  
  Scenario: Unsuccessful signup
    Given a user visits the signup page
    When I submit invalid signup information
    Then I should see an error message

  Scenario: Successful signup
    Given a user visits the signup page
      And the user has an account
      And the user submits valid signup information
    Then he should see his profile page
      