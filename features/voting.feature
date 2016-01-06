Feature: Voting

  @wip @javascript
  Scenario: A producer upvotes a sound
    Given I have an account as a producer
      And I'm signed in
      And A sound exists
      And I'm on the sound show page
    When I upvote a sound
    Then The sound will have a vote
      And I will be able to see the total votes on the page
