Feature: delete a movie

  As an attacker
  So that I can delete movies
  I want to delete movies

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      | Ridley Scoot |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: delete existing movie
  Given I am on the details page for "Alien"
  When  I press "Delete"
  Then  I should be on the home page
  When I check the following ratings: PG, R, PG-13, G, NC-17
  And I press "Refresh"
  Then I should not see "'Alien'" 