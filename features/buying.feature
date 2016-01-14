Feature: Buying a sample pack

  @javascript
  Scenario: A producer purchases a sample pack
    Given I have an account as a producer
      And I'm signed in
      And a sample pack exists
      And I'm on the sample packs index page
    When I choose to purchase a sample pack
    # capybara can't find this form
    # Then I will be show the form to enter my credit card details
    # When I fill in the form with valid information
    # Then I will be taken to the sample pack show page
