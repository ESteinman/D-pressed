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

        Scenario:
            Then show me the page
            When I click on 'current_user_show'
            Then I should be redirected to the "My account" page
