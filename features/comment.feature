Feature: Commenting on a sound

  @javascript
  Scenario: A producer comments on a sound
    Given I have an account as a producer
      And I'm signed in
      And I have uploaded a sound
      And I'm on the sound show page
    When I choose to leave a comment
    Then I will be shown a comment box
    When I enter a valid body
      And submit the comment
    Then the sound will have a comment
