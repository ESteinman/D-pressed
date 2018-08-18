Feature: Internal administration page for user
    As a User, 
    In order to manage my personal details,
    I would like to be able to access my Internal page.

    Background: 
        Given the following user exists
        | email          | password    |
        | pablo@test.com | my-password |
        And I am logged in as 'pablo@test.com'
        And I am on the 'landing' page

        Scenario: User visit My accunt page
            When I click on 'My account'
            Then I should be redirected to the "My account" page
            
        Scenario: User can update password
            When I am on the 'My account' page
            And I click on "Edit your account"
            And I fill in 'Email' field with 'pablo@test.com'
            And I fill in 'Password' field with 'pablos-password'
            And I fill in 'Password confirmation' field with 'pablos-password'
            And I fill in 'Current password' field with 'my-password'
            And I click on 'Update'

        Scenario: User delete account
            When I am on the 'My account' page
            And I click on "Edit your account"
            Then I should see 'Cancel my account'
            And I should see 'Unhappy?'
            And I click on 'Cancel my account'
            
            