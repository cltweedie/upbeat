Feature: Sellers

  @javascript
  Scenario: A producer registers as a seller
    Given I have an account as a producer
      And I'm signed in
      And I'm on the sounds index page
    When I choose to view my account settings
    Then I will be taken to the account settings page
    When I choose to register as a seller
    Then I will see a modal asking me to confirm
    When I confirm
    Then I will see a flash notice "Thank you for registering as a seller."
      And I will have an account as a seller

  Scenario: A seller uploads a premium sample pack
    Given I have an account as a seller
      And I'm signed in
      And I'm on the my sounds page
    When I choose to add a new sample pack
    Then I will be taken to the new sample pack page
    When I fill in the form with valid details
      And I submit the sample pack
    Then a new sample pack will exist
      And I will see a flash notice "Sample pack uploaded successfully"
      And I will be taken to the sample pack show page
