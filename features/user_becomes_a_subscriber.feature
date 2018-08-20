Feature: A registered User can become a Subscriber
    As a registered User,
    In order to be able to see premium content,
    I would like to become a Subscriber of the service.

    Background:
        Given the following user exists
        | email          | password    |
        | pablo@test.com | my-password |
        And I am logged in as 'pablo@test.com'
        And I am on the 'landing' page

    Scenario:
            When I click on 'My account'
            Then I should be redirected to the "My account" page
            And I click on 'Manage your Subscription'