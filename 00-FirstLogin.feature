@Regression  @SkipFSRLogin @ShowStopper
Feature: First User Login

  @Sanity
  Scenario: Update password for first user login
   Given Navigate to FortiSOAR
   Then Verify EULA page is displayed
   When Click Accept EULA button
  	Then Login page is displayed
    When Enter Valid Credentials
    When Click Login Button
    Then Reset Password dialog box is  visible
    When Enter New Password
    When Enter Confirm New Password
    When Click Reset Password button
    Then Verify the user is logged in

