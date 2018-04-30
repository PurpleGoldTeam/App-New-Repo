Feature: view_profile
Scenario: View Profile

Given I exist as a user
And I am logged in  
When I press profiles
Then I should see "Name"
And I should see profiles
# And I should see "Show"
# Then I press "Show"
# Then I should see "Bridget Yokiel"