Feature: login

    Scenario: User is not logged in
      Given I do not exist as a user
      When I submit invalid login information
      #Then I should see an error login message
      Then I should create an account
        

    Scenario: User logs in successfully
      Given I exist as a user
        And I am not logged in
      When I login with valid credentials
      Then I should see my profile page
 
      #Then I should see a successful login message
      

    Scenario: User enters wrong email
      Given I exist as a user
      And I am not logged in
      #When I login with a wrong email
      #Then I see an invalid login message
      
      
    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      #When I login with a wrong password
      #Then I should see an invalid login message
     
