Feature: Profile

  Background:
    Given I have an account as a producer
      And I'm signed in

  @javascript
  Scenario: A producer views their profile
    Given I'm on the sounds index page
    When I choose to view my profile
    Then I will be taken to the my profile page

  Scenario: A producer edits their profile
    Given I'm on my profile page
    When I choose to edit my profile
    Then I will be taken to the edit profile page
    When I edit a field
      And submit the form
    Then My profile will be updated
      And I will see a flash notice "Your profile has been updated."
      And I will be taken to the my profile page

  @wip
  Scenario: A producer uploads an avatar
    Given I'm on my profile page
    When I choose to edit my profile
    Then I will be taken to the edit profile page
    When I choose a profile image
      And submit the form
    Then I will be taken to the my profile page
      And My profile will show the new image


