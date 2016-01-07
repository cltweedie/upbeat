Feature: Viewing my own sounds

  @wip
  Scenario: A producer views their own sounds
    Given I have an account as a producer
      And I'm signed in
      And I have uploaded a sound
      And I'm on the sounds index page
    When I choose to view my sounds
    Then I will be taken to the my sounds page
      And I will be able to see my sounds
