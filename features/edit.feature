Feature: edit a movie

  As a movie buff
  So that I can edit movies that I like most
  I want to edit movies

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      | ferhat elmas |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: delete existing movie
  Given I am on the edit page for "Alien"
  When  I fill in "Director" with "Ridley Scott"
  And I press "Update Movie Info"
  Then I should be on the details page for "Alien"
  And I should see "Ridley Scott"
  And I should not see "ferhat elmas"