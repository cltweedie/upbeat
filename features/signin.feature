Feature: Signing in

  Scenario: A visitor registers as a producer
    Given I have an account as a producer
      And I'm on the homepage
    When I choose to sign in
    Then I will be taken to the sign-in page
    When I fill in the form with valid sign-in information
      And I sign in
    Then I will see a flash notice "Signed in successfully"
      And I will be taken to the sounds index page
