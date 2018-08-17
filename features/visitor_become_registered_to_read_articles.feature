Feature: A visitor needs to become a registered user in order to read the articles
    As a Visitor
    In order to be able to read the articles
    I would like to become a registered (non paying) User

    Background:
        Given the following article exists
        | title          | body                                                             | 
        | This is so sad | A recent report suggest that news are mostly sad. Which is sad.  | 

    Scenario: Visitor registers
        When I am on the 'Registration' page
        And I fill in 'Email' field with 'pablo@test.com'
        And I fill in 'Password' field with 'my-password'
        And I fill in 'Password confirmation' field with 'my-password'
        And I click on 'Sign up'
        Then I should see 'Welcome! You have signed up successfully.'
   
    Scenario: Visitor tries to read article 
        When I am on the 'Landing' page
        And I click on "This is so sad"
        Then I should be redirected to the "Registration" page

