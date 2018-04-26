Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username, different fields and password

    Scenario: I login and edit my name
      Given I am logged in
      When I edit my account name
      And I save the save changes
      Then I should see an account edited message

    Scenario: I login and edit my email address
      Given I am logged in
      When I edit my email address
      And I save the save changes
      Then I should see an account edited message

    Scenario: I edit my account without current password
      Given I am logged in
      When I edit my email address
      And I don't enter my current password
      And I save the save changes
      Then I should see a current password missing message

    Scenario: I login and edit with invalid email
      Given I am logged in
      When I edit my email address with an invalid email
      And I save the save changes
      Then I should see an invalid email message

    Scenario: I login and edit my password
      Given I am logged in
      When I edit my password
      And I save the save changes
      Then I should see an account edited message

    Scenario: I login and edit my password with missing confirmation
      Given I am logged in
      When I edit my password with missing confirmation
      And I save the save changes
      Then I should see a mismatched password message

    Scenario: I login and edit my password with mismatched confirmation
      Given I am logged in
      When I edit my password with missmatched confirmation
      And I save the save changes
      Then I should see a mismatched password message
