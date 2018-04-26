Feature: Logout

Scenario: User logout
  Given I am logged in
  When I press logout
  Then I should be on the homepage
  