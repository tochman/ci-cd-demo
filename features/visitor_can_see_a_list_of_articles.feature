Feature: Visitor can see a list of articles

  As a visitor
  In order to choose what to read
  I would like to see a list of current news articles on the site

  Scenario: View list of news articles on landing page
    Given the following news articles exist in our database:
      | title                       | content                                    |
      | Sweden has a new government | Äntligen!                                  |
      | No more burning cars        | Stability and order restored in Stoclholm. |

    When I visit the site
    Then I should see a list of articles
    And I should see "Sweden has a new government"
    And I should see "No more burning cars"