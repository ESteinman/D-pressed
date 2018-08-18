Feature: Visitor can view articles on the landing page
    As an Editor
    In order to catch people's interest
    I would like to have the articles displayed on the landing page

    Background:
        Given the following article exists
        | title          | body                                                             |       
        | This is so sad | A recent report suggest that news are mostly sad. Which is sad.  |       

    Scenario: Visitor can view articles on the landing page
        When I am on the 'landing' page
        Then I should see 'This is so sad'
        And I should see 'A recent report suggest that news are mostly sad. Which is sad.'
        And I should see '2018-08-18'

    
       

