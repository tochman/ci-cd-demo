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
      | email              | role      |
      | thomas@craft.se    | visitor   |
      | faraz@craft.se     | visitor   |
      | moderator@craft.se | moderator |

    And I'm logged in as "thomas@craft.se"
    And I visit the site

  Scenario: Visitor submits a comment and deletes it
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

  Scenario: Visitor attempts to delete comment he has not written himself
    Given I am reading the article titled "No more burning cars"
    And I fill in "Comment" with "This is awesome!"
    And I fill in "Your name" with "Thomas"
    And I click "Send comment"
    And I log out
    Given I log in as "faraz@craft.se"
    And I visit the site
    When I click on "Delete comment"
    And I focus on the comments
    Then I should see "You are not allowed to perform this action"


  Scenario: A Moderator can delete comment he has not written himself
    Given I am reading the article titled "No more burning cars"
    And I fill in "Comment" with "This is f__ked up"
    And I fill in "Your name" with "Thomas"
    And I click "Send comment"
    And I log out
    Given I log in as "moderator@craft.se"
    And I visit the site
    When I click on "Delete comment"
    And I focus on the comments
    # Then show me the page
    Then I should not see "This is f__ked up"
    But I should see "Your comment has been deleted"