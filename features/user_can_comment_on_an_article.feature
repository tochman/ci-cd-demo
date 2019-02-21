Feature: User can comment on an article

  As a fairly intelligent User
  In order to share my views with other ignorant reader
  I would like to be able to post comments about an article

  Background:
    Given the following news articles exist in our database:
      | title                       | content                                    |
      | Sweden has a new government | Äntligen!                                  |
      | No more burning cars        | Stability and order restored in Stoclholm. |

    And I visit the site

  Scenario: Visitor submits a comment
    Given I am reading the article titled "No more burning cars"
    And I fill in "Comment" with "This is awesome!"
    And I fill in "Your name" with "Thomas"
    And I click "Send comment"
    Then I should see "This is awesome!"
    And I should see "Thomas commented on 2019-02-21"
    But when I am looking at the article titled "Sweden has a new government"
    Then I should not see "This is awesome!"
    And I should not see "Thomas commented on 2019-02-21"






