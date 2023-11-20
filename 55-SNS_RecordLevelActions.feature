Feature: SNS_DirectConnectorActions
    
   @SNS
   Scenario: Execute Direct Connector Actions on Agent
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    And Add record details
     |Name|
     |AlertCreatedForSNSConnectorExecution|
    And Click "Save" button
    Then Verify toaster message appears
     |You have created "AlertCreatedForSNSConnectorExecution|
    When Click Actions Button
    Then Verify Actions Window is opened
    When Search Connector in Action Window
    Then Verify Connector is Searched
    When Select Connector
    Then Verify Connector Actions are listed
    When Select Action Get IP Reputation
    Then Verify Execute Action Window is Opened
    When Click Agent Tab
    Then Verify Agent is selected
    Then Verify Agent default configuration is selected
    When Enter IP
    When Click Execute Action
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Verify Key Value Section is displayed
    Then Verify Save Selected Output Keys Button is displayed
    When Select Output Key
    Then Save Selected Output Keys Button is enable
    When Click Save Selected Output Keys Button
    When Click Workspace Icon
    Then Verify Workspace is opened
    Then Verify Output Added section is present
    Then Verify Action Get IP Reputation is present
    Then Verify ActionLog tag is added
    Then Verify View Details link is present
    When Click View Detail link
    Then Verify Connector Action Log window is opened
    Then Verify Output Tab is displayed
    Then Verify Input Tab is displayed
    Then Close Connector Action Log window
    Then Close Workspace Window
