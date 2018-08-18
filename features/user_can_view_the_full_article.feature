Feature: User can view the full article
    As a visitor,
    In order to read the full article,
    I would like to be able to access the article page.

    Background:
        Given the following article exists
        | title          | body                                                             | 
        | This is so sad | A recent report suggest that news are mostly sad. Which is sad.  |
        And the following user exists
        | email          | password    |
        | pablo@test.com | my-password |
        And I am logged in as 'pablo@test.com'

    Scenario:
        When I am on the 'landing' page
        And I click on "This is so sad"
        Then I am on the "This is so sad" page
        And I should see "This is so sad"
        And I should see "A recent report suggest that news are mostly sad. Which is sad"
        And I should see "2018-08-18"