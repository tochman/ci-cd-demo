Feature: Logged in user can comment on an article and delete it afterwards

  As a commenter
  In order to ensure that my comments are relevant
  I should be able to change my mind and delete a submitted comment


  Background:
    Given the following news articles exist in our database:
      | title                       | content                                    |
      | Sweden has a new government | Äntligen!                                  |
      | No more burning cars        | Stability and order restored in Stockholm. |

    And the following users exist in our database:
      | email           |
      | thomas@craft.se |
      | faraz@craft.se  |

    And I'm logged in as "thomas@craft.se"
    And I visit the site

  Scenario: Visitor submits a comment adn deletes it
    Given I am reading the article titled "No more burning cars"
    And I fill in "Comment" with "This is awesome!"
    And I fill in "Your name" with "Thomas"
    And I click "Send comment"
    Then I should see "This is awesome!"
    And I should see a link "Delete comment"
    When I click on "Delete comment"
    And I focus on the comments
    Then I should not see "This is awesome!"
    But I should see "Your comment has been deleted"
