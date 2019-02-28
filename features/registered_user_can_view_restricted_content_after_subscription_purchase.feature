Feature: "Registered user can view restricted content after subscription purchase"

  Feature Description



  Background:
    Given the following users exist in our database:
      | email           | role       |
      | thomas@craft.se | subscriber |
      | faraz@craft.se  | visitor    |

    Given the following news articles exist in our database:
      | title                       | restricted |
      | Sweden has a new government | true       |
      | No more burning cars        | false      |

  Scenario: Visitor can NOT view restricted content
    Given I'm logged in as "faraz@craft.se"
    And I visit the site
    And I click on "Sweden has a new government"
    Then I should see "You need to purchase a subscription to view this article"

  Scenario: Visitor can view NON restricted content
    Given I'm logged in as "faraz@craft.se"
    And I visit the site
    And I click on "No more burning cars"
    Then I should not see "You need to purchase a subscription to view this article"

  Scenario: Subscriber can view restricted content
    Given I'm logged in as "thomas@craft.se"
    And I visit the site
    And I click on "Sweden has a new government"
    Then I should not see "You need to purchase a subscription to view this article"

@javascript
  Scenario: Visitor can purchase subscription and view restricted content
    Given I'm logged in as "faraz@craft.se"
    And I visit the site
    And I click on "Sweden has a new government"
    And I fill in the payment form
    Then show me the page
    And I submit the payment form
    Then I should see "Thank you for subscribing!"
    And I click on "Sweden has a new government"
    Then I should not see "You need to purchase a subscription to view this article"
