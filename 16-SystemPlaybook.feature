@Regression
Feature: System Playbook

   @Sanity @SNS
  Scenario: Escalate Alert to Incident
    When Navigate to Alerts Page
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    Then Add alert details
    When Click on Save Button
    Then Verify Alert Detail View is displayed    
    When Click Escalate button
    Then Verify Escalate Incident form is displayed
    When Add Incident details
    When Click Execute button
    Then Verify Alert is escalated to Incident
