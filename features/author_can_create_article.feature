@javascript
Feature: Create article
    As an User
    In order to publish news
    I would like to be able to create an article

    Background:
        Given the following user exists
            | email          | role   |
            | pablo@test.com | author |
        And the date is "2018-08-19"
        And I am logged in as 'pablo@test.com'
        And I visit the Create article page


    Scenario: Successfully create Article [Happy path]
        When I fill in 'Title' field with 'My sad news story'
        And I fill in 'Body' field with 'Here is bodytext if a long sad news article'
        And I click on 'Create Article'
        Then I wait 1 second
        And I should be redirected to the 'landing' page
        Then there should be a Article titled 'My sad news story' in the database
        And I should see 'Article successfully created'
        And I should see 'My sad news story'
        And I should see 'Published on'
        And I should see '2018-08-19'

    Scenario: User does not fill in Title [Sad path]
        When I fill in 'Body' field with 'Here is bodytext if a long sad news article'
        And I click on 'Create Article'
        Then I wait 1 second
        Then I should see "Fields can't be blank. Your article could not be saved"

    Scenario: Author does not fill in Body [Sad path]
        When I fill in 'Title' field with 'My sad news story'
        And I click on 'Create Article'
        Then I wait 1 second
        Then I should see "Fields can't be blank. Your article could not be saved"