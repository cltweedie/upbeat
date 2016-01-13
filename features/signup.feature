Feature: Signing up

  Scenario: A visitor registers as a producer
    Given I'm on the homepage
    When I choose to sign up
    Then I will be taken to the sign-up page
    When I fill in the form with valid sign-up information
      And I sign up
    Then a producer will be created
    And I will be taken to the homepage
    # commented out as not set up on heroku
    # And I will receive a welcome email
