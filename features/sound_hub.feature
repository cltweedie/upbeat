Feature: My sounds

  Scenario: A producer views their own sounds
    Given I have an account as a producer
      And I'm signed in
      And I have uploaded a sound
      And I'm on the sounds index page
    When I choose to view my sounds
    Then I will be taken to the my sounds page
      And I will be able to see my sounds

  @wip
  Scenario: A producer uploads a new sound
    Given I have an account as a producer
      And I'm signed in
      And I'm currently on the my sounds page
    When I choose to add a new sound
    Then I will be taken to the new sound page
    When I fill in the new sound form with valid details
      And choose an audio file to upload
      And I submit the new sound form
    Then The sound will be created
      And I will be taken to the sound show page
      And I will see a flash notice "Sound successfully uploaded."
