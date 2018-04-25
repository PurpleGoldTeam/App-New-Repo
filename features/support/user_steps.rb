####################SIGNUP#####################

Given /^a user visits the signup page$/ do
  visit signup_path
end

When /^I submit invalid signup information$/ do
  click_button "Create my account"
end

Then /^I should see an error message$/ do
  page.should have_content("Email is invalid", "Password is too short (minimum is 6 characters)")
  # check for the error message 

end

Given /^the user has an account$/ do
  @user = User.create(:name => 'Example User', :email => "example@example.com",
                              :password => "foobar", :password_confirmation => "foobar" )
end

Given /^the user submits valid signup information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Create my account"
end

Then /^he should see his profile page$/ do
  #page.should have_css("h1", :text => "")
  #page.should have_selector('title', text: @user.name)
  visit users_path
  
end

Then /^he should see a logout link$/ do
  page.should have_link('Log Out', href: logout_path)
end

#################################################################################################################################


#######################################LOGOUT#################################

Given /^I am logged in$/ do
  visit login_path
end

When /^I press logout$/ do
  visit root_path
end


When /^I should be the homepage$/ do
  page.should have_content "Sign up now"
  page.should have_content "Login"
end


#################LOGIN######################

Given /^I do not exist as a user$/ do
  visit signup_path
end

When /^I submit invalid login information$/ do
  page.should have_link('Log in', href: login_path)
  #visit login_path
  #click_button "Log in"
end

=begin
Then /^I should see an error login message$/ do
  page.should have_content('Invalid email/password combination')

=end


Then /^I should create an account$/ do
  #page.should have_link('Sign up now', href: signup_path)
  #page.should have_content "Sign up now"
  visit signup_path

end



Given /^I exist as a user$/ do
   @user = User.create(:name => 'Example User', :email => "example@example.com",
                              :password => "foobar", :password_confirmation => "foobar" )
end

Given /^I am not logged in$/ do
  visit login_path
end

When /^I login with valid credentials$/ do
  page.should have_link('Log in', href: login_path)
end

Then /^I should see my profile page$/ do
  visit users_path
end


=begin
When /^I login with a wrong email$/ do
  page.should have_content('Invalid email/password combination')

end

When /^I login with a wrong password$/ do
  page.should have_content('Invalid email/password combination')
end



Then /^I see a successful login message$/ do
  page.should have_content "Logged in successfully."
end


Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end



Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email/password."
end
=end


