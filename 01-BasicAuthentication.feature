@Regression @SkipFSRLogin
Feature: Basic Authentication

   @Sanity
  Scenario: Login with invalid credentials
    Given Login page is displayed
    When Enter Invalid Credentials
    When Click Login Button
    Then Verify the Validation Error message

   @Sanity
  Scenario: Login with valid credentials
    Given Login page is displayed
    When Enter Valid Credentials
    When Click Login Button
    Then Verify the user is logged in

   @Sanity
  Scenario: Change default credentials for Admin User
    Given Verify execution of below scenarios is successful
      | Login with valid credentials |
    When Change User Password
    Then Verify User is Logged Out
    When Login with changed password
    Then Verify the user is logged in

