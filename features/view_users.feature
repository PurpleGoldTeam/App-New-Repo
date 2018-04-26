Feature: Show Users
  As a new user to the website
  I want to see registered users listed 
  so I can know if the site has users

    Scenario: Viewing users
      Given I exist as a user
      When I look at the list of users
      Then I should see my name