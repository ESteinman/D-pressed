@javascript
Feature: User can rate an article
    As a User,
    In order to leave my feedback to the article that I have just read,
    I would like to be able to rate it.

    Background:
        Given the date is "2018-08-18"
        Given the following article exist
        | title          | body                                                             | 
        | This is so sad | A recent report suggest that news are mostly sad. Which is sad.  |
        And the following user exists
        | email          | password    | role      |
        | pablo@test.com | my-password | subscriber |
        And I am logged in as 'pablo@test.com'
    
    Scenario:
        When I am on the 'landing' page
        And I click on "This is so sad"
        Then I am on the "This is so sad" page
        And I should see "This is so sad"
        And I should see "A recent report suggest that news are mostly sad. Which is sad"
        And I should see "Published on: 2018-08-18"
        And I click "1" on rating
        And I wait 1 second
        Then I should see "Thank you for your vote"
