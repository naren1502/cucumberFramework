@Regression @SkipFSRLogin @ShowStopper
Feature: License Deployment

   @PreConfigured
  Scenario: Upload license from UI
    Given Navigate to FortiSOAR
    When Click "Upload License" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag |
      | Pop Up Title | Upload License | h3  |
    When Upload license file
    Then Verify "Install License File" button is enabled
    When Click "Install License File" button
    Then Verify Visible text
      | Text Type    | Text to Search | Tag  |
      | Pop Up title | Confirm        | span |
    When Click "Confirm" button
    Then Verify EULA page is displayed
