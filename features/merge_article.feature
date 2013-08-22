Feature: Merge Articles
  As a blog administrator
  In order to combine my shared thoughts with the world
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I have article "merge test 1" by author "admin"
    And I have article "merge test 2" by author "tester"

  Scenario: Do not see merge option on new
    Given I am logged into the admin panel
    When I follow "New Article"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "merge test 1"
    Then I should see "Merge Articles"
    When I press "Merge"
    Then I should see "Error"
#   Then show me the page

  Scenario:A non-admin cannot merge two articles
    Given I am logged in as a non-admin user
    And I am on the admin content page
    When I follow "merge test 2"
    Then I should not see "Merge"

