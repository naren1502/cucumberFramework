#Author: sunil@cybersponse.com
Feature: Rules

  @OnHold
  Scenario: Add New Rule Collection
    Given Automation is displayed
    When Click Automation
    Then Rule Engine is displayed
    When Click Rule Engine
    Then Verify User Navigated to Rule Engine
    When Click New Collection
    Then Add New Rule Collection Window Opens
    When Enter Collection Name
    Then Verify Create Button is Enabled
    When Click Create Button
    Then Verify New Rule Collection is Created

  @OnHold
  Scenario: Add New Rule
    Given Verify user is on Rule Collection page
    When Click Add Rule button
    Then Verify Add New Rule Window is Opened
    When Enter Rule Name
    Then Verify Create button is enabled
    When Click Create Rule button
    Then Verify Rules page is Opened
    When Click Active button
    Then Verify Default Value for Resource is selected
    When Select Alert Resource
    Then Verify Source Trigger is selected
    Then Verify Default Logical Operator AND is selected
    Then Verify Add Condition option is visible
    When Click Add Condition
    Then Verify Default Value for Field is selected
    When Select Severity Field
    Then Verify Default Operator is selected
    Then Verify Default Value for Severity is selected
    When Select High Severity
    When Click Add Action
    Then Verify Default Value for Action DropDown
    When Select Update Action
    Then Verify Edit option is visible
    When Click Edit Button
    Then Verify SET DATA window opened
    When Select Low Severity
    When Click Save button of SET DATA popup
    When Click Save button of Rule
    Then Verify Toaster message
    When Click Parent Rule Collection
    Then Verify Rule is Created Successfully

  @OnHold
  Scenario: Running rules status
    Given Verify user is on Rule Collection page
    When Navigate to Alerts Page
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    Then Add Rule Alert details
    When Click on Save Button
    Then Close Record Detail View
    Then Verify Rule Alert is created
    Given Automation is displayed
    When Click Automation
    Then Rule Engine is displayed
    When Click Rule Engine
    Then Verify User Navigated to Rule Engine
    When Click Running Rules
    When Search Rule
    Then Verify Rule Status is Finished
    Then Verify Modified time
    When Navigate to Alerts Page
    Then Alert Grid is displayed
    When Search Rule Alert
    Then Verify Severity is Low
